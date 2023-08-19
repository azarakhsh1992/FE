from django.contrib.auth.models import User
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from rest_framework import viewsets, status
from .mainmodels.userrelated.users import UserProfile
from web.serializers.serializers import UserProfileSerializer, UserSerializer
from web.serializers.serializers import DoorSensorSerializer, FullGroupShiftSerializer, \
    ShiftOfGroupSerializer
from .mainmodels.iolmodules.doorsensor import DoorsensorDevice
from .mainmodels.cabinetlevel.doors import Door
from .mainmodels.modules.iolink import Iolink
from .mainmodels.iolmodules.temperaturesensordevice import TemperaturesensorDevice
from web.serializers.serializers import Jsonserializer
from .mainmodels.cabinetlevel.cabinets import Cabinet
from .mainmodels.functionalities.json import Json_draft
import json
import requests
from web.serializers.serializers import CommandSerializer
from django.views.decorators.csrf import csrf_exempt
from .mainmodels.userrelated.groupofshifts import GroupShift, ShiftOfGroup
from .serializers.cabinetanddoor import CabinetSerializer


# ////////////////////////////////////////////////////////////////////////////////////////////////
class UserProfileViewset(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer


class UserViewset(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    # authentication_classes = [TokenAuthentication]
    # permission_classes = [AllowAny]
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
                    profileobj.accessable_cabinets = datas['accessable_cabinets']
                    profileobj.role = datas['role']
                    profileobj.bereich = datas['bereich']
                    profileobj.telephone = datas['telephone']
                    profileobj.group_id = datas['group']
                    profileobj.save()
                    serializer = UserProfileSerializer(profileobj)
                    response = {'message': 'updated'}
                    return Response(response, status=status.HTTP_200_OK)
                except:
                    profileobj = UserProfile.objects.create(user=storeduser, firstname=datas['firstname'],
                                                            lastname=datas['lastname'],
                                                            accessable_cabinets=datas['accessable_cabinets'],
                                                            role=datas['role'], bereich=datas['bereich'],
                                                            telephone=datas['telephone'], group_id=datas['group'])
                    response = {'message': 'created'}
                    return Response(response, status=status.HTTP_200_OK)
            except:
                response = {'message': 'Error Happened'}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {'message': 'Missing profile data'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)


class JasonViewset(viewsets.ModelViewSet):
    queryset = Json_draft.objects.all()
    serializer_class = Jsonserializer
    permission_classes = (AllowAny,)

    @action(methods=['PUT'], detail=True, serializer_class=CommandSerializer)
    def send_json(self, request, pk):
        # serializer = CommandSerializer(data=request)
        print(request)


@csrf_exempt
def CommandViewset(request):
    data = json.loads(request.body)
    mydata = Json_draft.objects.get(sensor=data.get('sensor'), command=data.get('command'))
    respon = {
        'cid': mydata.cid,
        'code': mydata.code,
        'adr': mydata.adr,
        "data": {"newvalue": "00"}
    }
    method = 'POST'
    url = "http://192.168.0.4"
    headers = {}
    headers['Content-Type'] = 'application/json'

    try:
        response = requests.request(method, url, data=json.dumps(respon), headers=headers)
        response.raise_for_status()  # Raise an exception for HTTP errors (4xx, 5xx)
        return response.json()
    except requests.exceptions.RequestException as e:
        raise e






# Token Custom Authorization
class CustomObtainAuthToken(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        response = super(CustomObtainAuthToken, self).post(request, *args, **kwargs)
        token = Token.objects.get(key=response.data['token'])
        user = User.objects.get(id=token.user_id)
        userSerilizer = UserSerializer(user, many=False)
        return Response({'token': token.key, 'user': userSerilizer.data})


class ShiftOfGroupViewset(viewsets.ModelViewSet):
    queryset = GroupShift.objects.all()
    serializer_class = FullGroupShiftSerializer


class ShiftsViewset(viewsets.ModelViewSet):
    queryset = ShiftOfGroup.objects.all()
    serializer_class = ShiftOfGroupSerializer

    @action(methods=['POST'], detail=False)
    def CustomFunc(self, request):
        try:
            data = request.data
            storeddata = ShiftOfGroup.objects.all()
            serialized = ShiftOfGroupSerializer(storeddata, many=True)
            response = {'message': 'data recieved', 'data recieved': data, 'somethin': serialized.data}
            return Response(response, status=status.HTTP_200_OK)
        except:
            response = {'message': 'Error Happened'}
            return Response('not Ok', status=status.HTTP_400_BAD_REQUEST)

    # def create(self, request, *args, **kwargs):
    #     data = request.data
    #     print(data)
