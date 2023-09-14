from django.contrib.auth.models import User
from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response

from ..mainmodels.cabinetlevel.cabinets import Cabinet
from ..mainmodels.cabinetlevel.doors import Door
from ..mainmodels.modules.iolink import Iolink
from ..mainmodels.requests.requests import Request, Servicelog
from ..serializers.cabinetanddoor import DoorSerializer, FullDoorSerializer
from ..serializers.requestserializers import RequestSerializer
from ..mainmodels.functionalities.function_access import access_checker, access_checker2
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
            cabinet = door.cabinet
            # for functionality un-comment below
            # access, accessresponse = access_checker(user=userobj, door=door)
            access, accessresponse = access_checker2(user=userobj, door=door)
            if access:
                eventreq = Request.objects.create(user=userobj, cabinet=cabinet, door=door, \
                                                  description=request.data['description'],
                                                  datetime=request.data['time'], servicelog=False, buttonstatus=False,
                                                  cancelinghdw=False, cancelingfrnt=False, sendtomiddleware=False)
                # TODO: send to container to open the door
                response = {'message': accessresponse}
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
        req_iolink = request.data['profinet_name']
        obj_iolink = Iolink.objects.get(profinet_name=req_iolink)
        obj_cabinet = obj_iolink.cabinet
        obj_request = Request.objects.get(cabinet=obj_cabinet, sendtomiddleware=False)
        obj_door = [obj.door for obj in obj_request]
        serializer = FullDoorSerializer(obj_door, many=True)
        customized_data = []
        for item in serializer.data:
            customized_data.append({
                'name': item.get('name')
            })
        for obj in obj_request:
            obj.sendtomiddleware = True
            obj.save()
        return Response(customized_data)
