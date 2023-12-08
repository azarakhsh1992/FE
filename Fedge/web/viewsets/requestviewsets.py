import datetime
from django.contrib.auth.models import User
from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly

from ..mainmodels.cabinetlevel.cabinets import Cabinet
from ..mainmodels.cabinetlevel.doors import Door
from ..mainmodels.equipment.plc import PLC
from ..mainmodels.requests.requests import Request, Servicelog
from ..serializers.cabinetanddoor import DoorSerializer, FullDoorSerializer
from ..serializers.requestserializers import RequestSerializer
from ..mainmodels.functionalities.function_access import access_checker
from ..serializers.serializers import UserSerializer
from ..mainmodels.userrelated.users import UserProfile

class RequestViewset(viewsets.ModelViewSet):
    queryset = Request.objects.all()
    serializer_class = RequestSerializer
    authentication_classes = [TokenAuthentication]
    permission_classes=[IsAuthenticated]

    @action(methods=['POST'], detail=False, authentication_classes = [TokenAuthentication], permission_classes=[IsAuthenticated])
    def userrequest(self, request):
        user = request.data['user']
        userobj = User.objects.get(username=user)
        if userobj:
            qrcode = request.data['qr']
            door = Door.objects.get(qr=qrcode)
            cabinet = door.rack.cabinet
            rack = door.rack
            # for functionality un-comment below
            access, accessresponse = access_checker(user=userobj, door=door)
            if access:
                eventreq = Request.objects.create(user=userobj, cabinet=cabinet, door=door, rack=rack,\
                    description="test",\
                        datetime=datetime.datetime.now(), servicelog=False, buttonstatus=False,\
                            cancelinghdw=False, cancelingfrnt=False, sendtomiddleware=False)
                # TODO: send to container to light an LED : it will send event base on container for watiting
                serialized_data = RequestSerializer(eventreq)
                req_id = serialized_data.data.get('id')
                response = {'message': accessresponse,
                            'access':access,
                            'id': req_id}
                # response = {'message':accessresponse,'access':access}
                return Response(response, status=status.HTTP_200_OK)
            else:
                response = {'message': accessresponse}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {'message': "User's data not Valid "}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'],detail=False)
    def userservice(self, request):
        user = request.data['user']
        userobj = User.objects.get(username=user)
        if userobj:
            userrequest = request.data['request']
            userservice = request.data['service']
            try:
                existreq = Request.objects.get(id=userrequest['id'])
                # TODO: if that door is closed
                if existreq.servicelog == False:
                    newservicelog = Servicelog.objects.create(request=existreq, description=userservice['description'], datetime=userservice['datetime'])
                    existreq.servicelog = True
                    existreq.save()
                    #TODO: send to plc: it will send event base on container for resetting LED, read from latch sensor if the latch is closed or open then
                    # send to front end as a warning, then after 3 seconds it gets the response check the latch sensor and then submit the log whatever the latch sensor is open or closed
                    response = {'message': 'service log submitted successfully'}
                    return Response(response,status=status.HTTP_200_OK)
                else:
                    response = {'message': 'user service log for this request has been submitted'}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
            except:
                response={'message':'this request is not exists'}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {'message': 'this user not exists'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)


    @action(methods=['POST'], detail=False)
    def middleware(self, request):
        req_plc = request.data['profinet_name']
        req_door = request.data['door']
        obj_plc = PLC.objects.get(profinet_name=req_plc)
        obj_cabinet = obj_plc.cabinet
        obj_request = Request.objects.get(cabinet=obj_cabinet, sendtomiddleware=False)
        obj_doors = [obj.door for obj in obj_request]
        serializer = FullDoorSerializer(obj_doors, many=True)
        customized_data = []
        for reqdoor in req_door:
            for door in serializer.data:
                if reqdoor.name == door.get('name'):
                    try:
                        _door_obj = Door.objects.get(cabinet=obj_cabinet, name=door.get('name'))
                        _onhandlereq = Request.objects.get(cabinet=obj_cabinet, door=_door_obj)
                        _onhandlereq.sendtomiddleware = True
                        _onhandlereq.save()
                        customized_data.append({
                            'name': door.get('name'),
                            "opening": True,
                            'request': 'exists'
                        })
                    except:
                        customized_data.append({
                            'name': door.get('name'),
                            "opening": False,
                            'request': 'some problem'
                        })
                else:
                    customized_data.append({
                        'name': door.get('name'),
                        "opening": False,
                        'request': 'not exists'
                    })
        return Response(customized_data)

    @action(methods=["POST"], detail=False)
    def frontend(self, request):
        req_frontend = request.data['request']
        req_id = req_frontend['id']
        try:
            obj_req = Request.objects.get(id=req_id)
            if obj_req.sendtomiddleware == True and obj_req.sendtofrontend == False and obj_req.cancelingfrnt == False and obj_req.buttonstatus == True:
                #TODO: send to container to light an LED : it will send event base on container for watiting
                response = {'access':True,
                            'message': 'door is open, please confirm servicelog after maintanance'}
                return Response(response, status=status.HTTP_200_OK)
            else:
                response = {'message': 'please wait'}
                return Response(response, status=status.HTTP_200_OK)
        except:
            response = {'message': 'this request not exists'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=["POST"], detail=False)
    def canclerequest(self, request):
        canceled_req = request.data['request']
        canceled_id = canceled_req['id']
        try:
            obj_req = Request.objects.get(id=canceled_id)
            if obj_req.cancelingfrnt == False:
                obj_req.cancelingfrnt = True
                obj_req.save()
                response = {
                    'message':'request canceled',
                }
                #TODO: send to container to light an LED : it will send event base on container for resetting the LED
                return Response(response,status=status.HTTP_200_OK)
        except:
            response = {
                'message':'request not exist or canceled before'
            }
            return Response(response,status=status.HTTP_400_BAD_REQUEST)
