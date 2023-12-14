from django.contrib.auth.models import User
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from rest_framework import viewsets, status
from .mainmodels.userrelated.users import UserProfile
from .mainmodels.equipment.doorsensor import DoorSensor
from .mainmodels.cabinetlevel.doors import Door
from .mainmodels.equipment.plc import PLC
from .mainmodels.equipment.temperaturesensordevice import TemperatureSensor
from .mainmodels.cabinetlevel.cabinets import Cabinet
import json
import requests
from django.views.decorators.csrf import csrf_exempt
from .mainmodels.userrelated.groupofshifts import EmployeeGroup, Shifts
from .serializers.cabinetanddoor import CabinetSerializer
from .serializers.serializers import UserProfileSerializer, UserSerializer, CommandSerializer, \
    FullGroupShiftSerializer, ShiftSerializer
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST

# ////////////////////////////////////////////////////////////////////////////////////////////////
class UserProfileViewset(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer


class UserViewset(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    authentication_classes = [TokenAuthentication]
    permission_classes = [AllowAny]
    @action(methods=['POST'], detail=False)
    def profiles(self, request):
        if 'profile' in request.data:
            try:
                user = request.data['username']
                storeduser = User.objects.get(username=user)
                id = storeduser.id
                datas = request.data['profile']
                datas['user'] = id
                # userprofile = UserProfile.objects.get(user_id=id)
                # print(userprofile.user)

                try:
                    profileobj = UserProfile.objects.get(user_id=id)
                    profileobj.firstname = datas['firstname']
                    profileobj.lastname = datas['lastname']
                    profileobj.role = datas['role']
                    profileobj.bereich = datas['bereich']
                    profileobj.telephone = datas['telephone']
                    profileobj.employee_group = datas['group']
                    profileobj.save()
                    serializer = UserProfileSerializer(profileobj)
                    response = {'message': 'updated'}
                    return Response(response, status=status.HTTP_200_OK)
                except:
                    profileobj = UserProfile.objects.create(user=storeduser, firstname=datas['firstname'],
                                                            lastname=datas['lastname'],
                                                            role=datas['role'], bereich=datas['bereich'],
                                                            telephone=datas['telephone'], employee_group=datas['employee_group'])
                    response = {'message': 'created'}
                    return Response(response, status=status.HTTP_200_OK)
            except:
                response = {'message': 'Error Happened'}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {'message': 'Missing profile data'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)




# Token Custom Authorization
class CustomObtainAuthToken(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        response = super(CustomObtainAuthToken, self).post(request, *args, **kwargs)
        token = Token.objects.get(key=response.data['token'])
        user = User.objects.get(id=token.user_id)
        userSerilizer = UserSerializer(user, many=False)
        return Response({'token': token.key, 'user': userSerilizer.data})


class EmployeeGroupViewset(viewsets.ModelViewSet):
    queryset = EmployeeGroup.objects.all()
    serializer_class = FullGroupShiftSerializer


class ShiftsViewset(viewsets.ModelViewSet):
    queryset = Shifts.objects.all()
    serializer_class = ShiftSerializer

    @action(methods=['POST'], detail=False)
    def CustomFunc(self, request):
        try:
            data = request.data
            storeddata = Shifts.objects.all()
            serialized = ShiftSerializer(storeddata, many=True)
            response = {'message': 'data recieved', 'data recieved': data, 'somethin': serialized.data}
            return Response(response, status=status.HTTP_200_OK)
        except:
            response = {'message': 'Error Happened'}
            return Response('not Ok', status=status.HTTP_400_BAD_REQUEST)
