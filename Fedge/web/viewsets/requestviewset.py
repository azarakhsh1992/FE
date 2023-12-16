from django.utils import timezone
from django.contrib.auth.models import User
from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly

from ..mainmodels.cabinetlevel.cabinets import Cabinet
from ..mainmodels.cabinetlevel.doors import Door
from ..mainmodels.equipment.plc import PLC
from ..mainmodels.equipment.latch import Latch
from ..mainmodels.equipment.led import LED,LedValueCases
from ..mainmodels.requests.requests import Request, Servicelog
from ..serializers.cabinetanddoor import DoorSerializer, FullDoorSerializer
from ..serializers.requestserializers import RequestSerializer
from ..mainmodels.functionalities.function_access import access_checker
from ..serializers.serializers import UserSerializer
from ..mainmodels.userrelated.users import UserProfile
from ..mainmodels.functionalities.mqtt_publish import send_mqtt_latch, send_mqtt_led
from ..mainmodels.functionalities.door_status import led_status_find
from ..mainmodels.userrelated.users import UserLog
import json
import ast

class RequestViewset(viewsets.ModelViewSet):
    queryset = Request.objects.all()
    serializer_class = RequestSerializer
    # authentication_classes = [TokenAuthentication]
    # permission_classes=[IsAuthenticated]

    # @action(methods=['POST'], detail=False, authentication_classes = [TokenAuthentication], permission_classes=[IsAuthenticated])
    @action(methods=['POST'], detail=False)
    def access_request(self, request):
        user = request.data['user']
        userobj = User.objects.get(username=user)
        if userobj:
            qrcode = request.data['qr']
            door = Door.objects.get(qr=qrcode)
            cabinet = door.rack.cabinet
            rack = door.rack
            access, accessresponse = access_checker(user=userobj, door=door)
            if access:
                eventreq = Request.objects.create(user=userobj, cabinet=cabinet, door=door, rack=rack,\
                    status="Access granted - Door was not opened",access=True,\
                        time=timezone.now(), servicelog=False, button_pushed=False,\
                            cancelled_by_frontend=False, sent_to_plc=False)
                serialized_data = RequestSerializer(eventreq)
                req_id = serialized_data.data.get('id')
                response = {'Messages': accessresponse,
                            'Access':access,
                            'ID': req_id}
                try:
                    led = LED.objects.get(door=door)
                    current_led_value = led_status_find(door=door)
                    latch_published_status, response1=send_mqtt_led(led=led, value=LedValueCases.objects.get(description="wait_button").value,delay=3,delayed_value=current_led_value)
                    
                except:
                    response1 = {'Error_p2.3': 'could not turn on the signal lamp'}
                userlog = UserLog.objects.create(user=userobj, request=eventreq)
                response['Messages'].update(response1)
                eventreq.description=response
                eventreq.save()
                return Response(response, status=status.HTTP_200_OK)
            else:
                eventreq = Request.objects.create(user=userobj, cabinet=cabinet, door=door, rack=rack,\
                    status="Access denied",access=False,\
                        time=timezone.now(), servicelog=False, button_pushed=False,\
                            cancelled_by_frontend=False, sent_to_plc=False)
                serialized_data = RequestSerializer(eventreq)
                req_id = serialized_data.data.get('id')
                response = {'Messages': accessresponse,
                            'Access':access,
                            'ID': req_id}
                try:
                    led = LED.objects.get(door=door)
                    current_led_value = led_status_find(door=door)
                    latch_published_status, response1=send_mqtt_led(led=led, value=LedValueCases.objects.get(description="access_denied").value, delay=2, delayed_value=current_led_value)
                    
                except:
                    response1 = {'Error_p2.3': 'could not turn on the signal lamp'}
                response['Messages'].update(response1)
                eventreq.description=response
                eventreq.save()
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {'message': "User's data not Valid "}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=["POST"], detail=False)
    def open_door(self, request):
        # req_frontend = request.data['request']
        # req_id = req_frontend['id']
        req_id = request.data['id']
        try:
            obj_req = Request.objects.get(id=req_id)
            door = obj_req.door
            if obj_req.sent_to_plc == False and obj_req.access == True and obj_req.sent_to_frontend == False and\
                obj_req.cancelled_by_frontend == False and obj_req.button_pushed == True:
                response = {'access':True,
                            'message': 'door is open, please confirm service-log after you are done.'}
                try:
                    latch_published_status, response1=send_mqtt_latch(latch=Latch.objects.get(door=door),\
                        value=True, delay=5, delayed_value= False)
                except:
                    response1={'message': 'no Latch found'}
                if latch_published_status:
                    obj_req.sent_to_plc = True
                    obj_req.status = "access granted - Door opened"
                    obj_req.save()
                else:
                    obj_req.status = "access granted - Door could not be opened - MQTT message not published"
                    obj_req.save()
                try:
                    
                    current_led_value = led_status_find(door=door)
                    if latch_published_status:
                        led_published_status, response2 = send_mqtt_led(led=LED.objects.get(door=door),\
                            value=LedValueCases.objects.get(description="access_granted").value, delay=2\
                                ,delayed_value=current_led_value)
                    elif latch_published_status==False:
                        led_published_status, response2 = current_led_value = send_mqtt_led(led=LED.objects.get(door=door),\
                        value=current_led_value,delay=2,delayed_value=current_led_value)
                except:
                    response2= {'message': 'No signal lamp found'}
                    
                return Response(response, status=status.HTTP_200_OK)
            else:
                response = {'Message': 'Waiting! Please push the Button'}
                try:
                    led = LED.objects.get(door=door)
                    current_led_value = led_status_find(door=door)
                    led_published_status, response2 = send_mqtt_led(led=led, value=LedValueCases.objects.get(description="wait_button").value,\
                        delay=2,delayed_value=current_led_value)
                except:
                    response2={'message': 'no signal lamp found'}
                return Response(response, status=status.HTTP_200_OK)
        except:
            response = {'message': 'this request does not exist.'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
        
        
    @action(methods=["POST"], detail=False)
    def cancelling_by_frontend(self, request):
        # cancelled_req = request.data['request']
        # cancelled_id = cancelled_req['id']
        cancelled_id = request.data['id']
        try:
            obj_req = Request.objects.get(id=cancelled_id)
            door=obj_req.door
            if obj_req.cancelled_by_frontend == False:
                obj_req.cancelled_by_frontend = True
                obj_req.status = "request expired - Door Button not pushed"
                obj_req.save()
                response = {
                    'message':'request expired - Door Button not pushed',
                }
                try:
                    current_led_value = led_status_find(door=door)
                    send_mqtt_led(led=LED.objects.get(door=door),\
                        value=LedValueCases.objects.get(description="request_expired").value,delay=2,delayed_value=current_led_value)
                except:
                    response = {'message_request':'request expired'}
                
                new_description = ast.literal_eval(obj_req.description)
                new_description['Messages'].update(response)
                obj_req.description = new_description
                obj_req.save()
                return Response(response,status=status.HTTP_200_OK)
            else:
                response = {'message':'request already expired'}
                return Response(response,status=status.HTTP_400_BAD_REQUEST)
        except:
            response = {'message':'request does not exist'}
            return Response(response,status=status.HTTP_400_BAD_REQUEST)
        
        
    @action(methods=['POST'],detail=False)
    def userservice(self, request):
        user = request.data['user']
        userobj = User.objects.get(username=user)
        #####TODO: this function needs the door to be able to light the LED accordingly
        qrcode = request.data['qr']
        door = Door.objects.get(qr=qrcode)
        #########
        if userobj:
            userrequest = request.data['request']
            userservice = request.data['service']
            try:
                existreq = Request.objects.get(id=userrequest['id'])
                # TODO: if that door is closed
                if existreq.servicelog == False:
                    newservicelog = Servicelog.objects.create(request=existreq, description=userservice['description'], time=userservice['time'])
                    existreq.servicelog = True
                    existreq.save()
                    #TODO: send to plc: it will send event base on container for resetting LED, read from latch sensor if the latch is closed or open then
                    # send to front end as a warning, then after 3 seconds it gets the response check the latch sensor and then submit the log whatever the latch sensor is open or closed
                    try:
                        current_led_value = led_status_find(door=door)
                        send_mqtt_led(led=LED.objects.get(door=door), value=LedValueCases.objects.get(description="door_not_locked").value,delay=2,delayed_value=current_led_value)
                    except:
                        pass
                    try:
                        userlog = UserLog.objects.get(user=userobj, request=existreq)
                        userlog.servicelog = newservicelog
                        userlog.save()
                    except:
                        pass
                    response = {'message': 'service log submitted successfully'}
                    return Response(response,status=status.HTTP_200_OK)
                else:
                    response = {'message': 'user service log for this request has been submitted'}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
            except:
                response={'message':'this request does not exist'}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {'message': 'this user does not exist'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)



        
        
        
        
        
        
        
        
