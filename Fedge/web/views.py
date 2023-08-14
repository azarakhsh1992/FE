from django.contrib.auth.models import User
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.authentication import TokenAuthentication
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly
from rest_framework.decorators import action
from rest_framework import viewsets, status
from .mainmodels.users import UserProfile
from .mainmodels.serializers import UserProfileSerializer, UserSerializer, ButtonSerializer, CabinetSerializer
from .mainmodels.serializers import DoorSensorSerializer, FullGroupShiftSerializer,ShiftOfGroupSerializer
from .mainmodels.door_sensor import Door_sensor
from .mainmodels.doors import Door
from .mainmodels.iolink import Io_link
from .mainmodels.temperature_sensor import Temperature_sensor
from .mainmodels.serializers import Jsonserializer
from .mainmodels.cabinets import Cabinet
from .mainmodels.json import Json_draft
import json
import requests
from .mainmodels.serializers import CommandSerializer
from django.views.decorators.csrf import csrf_exempt
from .mainmodels.groupofshifts import GroupShift,ShiftOfGroup


# ////////////////////////////////////////////////////////////////////////////////////////////////
class UserProfileViewset(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer


class UserViewset(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    # authentication_classes = [TokenAuthentication]
    # permission_classes = [AllowAny]


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


class CabinetViewset(viewsets.ModelViewSet):
    queryset = Cabinet.objects.all()
    serializer_class = CabinetSerializer

    authentication_classes = [TokenAuthentication]
    permission_classes = [AllowAny]

    @action(methods=['POST'], detail=False)
    def checkTemp(self, request, qr):
        door = Door.objects.get(qr=qr)
        cabinet = Cabinet.objects.get(door=door)
        iolink = Io_link.objects.get(cabinet=cabinet)
        value = Temperature_sensor.objects.get(iolink=iolink).value_temperature
        return Response({'temp': value}, status.HTTP_200_OK)

    @action(methods=['POST'], detail=False)
    def checkEnergy():
        pass

    @action(methods=['POST'], detail=False)
    def checkDoorSensor():
        pass

    @action(methods=['POST'], detail=False)
    def checkActuator():
        pass

    @action(methods=['POST'], detail=False)
    def checkLed():
        pass

    @action(methods=['POST'], detail=False)
    def checkButton():
        pass

    @action(methods=['POST'], detail=False)
    def checkLock():
        pass


class DoorSensorViewset(viewsets.ModelViewSet):
    queryset = Door_sensor.objects.all()
    serializer_class = DoorSensorSerializer


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