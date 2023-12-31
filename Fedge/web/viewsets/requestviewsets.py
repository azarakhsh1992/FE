from django.contrib.auth.models import User
from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response

from ..mainmodels.cabinetlevel.cabinets import Cabinet
from ..mainmodels.cabinetlevel.doors import Door
from ..mainmodels.equipment.plc import PLC
from ..mainmodels.requests.requests import Request, Servicelog
from ..serializers.cabinetanddoor import DoorSerializer, FullDoorSerializer
from ..serializers.requestserializers import RequestSerializer
from ..mainmodels.functionalities.function_access import access_checker
from ..serializers.serializers import UserSerializer


class RequestViewset(viewsets.ModelViewSet):
    queryset = Request.objects.all()
    serializer_class = RequestSerializer

    @action(methods=['POST'], detail=False)
    def userrequest(self, request):
        user = request.data['user']
        userserserializer = UserSerializer(data=user)
        if userserserializer.is_valid():
            userobj = User.objects.get(**userserserializer.validated_data)
            qrcode = request.data['qrcode']
            door = Door.objects.get(qr=qrcode)
            cabinet = door.rack.cabinet
            rack = door.rack
            # for functionality un-comment below
            # access, accessresponse = access_checker(user=userobj, door=door)
            access, accessresponse = access_checker(user=userobj, door=door)
            if access:
                eventreq = Request.objects.create(user=userobj, cabinet=cabinet, door=door, rack=rack,\
                    description=request.data['description'],\
                        datetime=request.data['time'], servicelog=False, buttonstatus=False,\
                            cancelinghdw=False, cancelingfrnt=False, sendtomiddleware=False)
                # TODO: send to container to light an LED : it will send event base on container
                serialized_data = RequestSerializer(eventreq)
                req_id = serialized_data.data.get('id')
                response = {'message': accessresponse,
                            'id': req_id}
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
        userserserializer = UserSerializer(data=user)
        if userserserializer.is_valid():
            userrequest = request.data['request']
            userservice = request.data['service']
            try:
                existreq = Request.objects.get(id=userrequest['id'])
                # TODO: if that door is closed
                if existreq.servicelog == False:
                    newservicelog = Servicelog.objects.create(request=existreq, description=userservice['description'], datetime=userservice['datetime'])
                    existreq.servicelog = True
                    existreq.save()
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
        req_id = req_frontend.id
        try:
            obj_req = Request.objects.get(id=req_id)
            if obj_req.sendtomiddleware == True and obj_req.sendtofrontend == False:
                response = {'message': 'door is open, please confirm servicelog after maintanance'}
                return Response(response, status=status.HTTP_200_OK)
            else:
                response = {'message': 'please wait'}
                return Response(response, status=status.HTTP_200_OK)
        except:
            response = {'message': 'this request not exists'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)