from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from ..mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from ..mainmodels.equipment.energymodule import EnergySensor,EnergySensorValue
from ..mainmodels.equipment.doorsensor import DoorSensor,DoorsensorValue
from..mainmodels.equipment.latch import Latch,LatchValue
from..mainmodels.equipment.latchsensor import LatchSensor,LatchSensorValue
from..mainmodels.equipment.led import LED,LedValue
from..mainmodels.equipment.button import DoorButton,ButtonValue
from..mainmodels.equipment.devices import Device
from..serializers.serializers import UserProfileSerializer, UserSerializer

from django.views.decorators.csrf import csrf_exempt
from ..mainmodels.userrelated.users import UserProfile
from django.db import models
from django.contrib.auth.models import User
from ..mainmodels.userrelated.groupofshifts import EmployeeGroup, Shifts, ShiftAssignment
from ..mainmodels.cabinetlevel.doors import Door
from ..mainmodels.functionalities.function_access import access_checker
from ..mainmodels.functionalities.mqtt_publish import send_mqtt_latch
from django.utils import timezone


class test_access(viewsets.ModelViewSet):
    serializer_class = UserProfileSerializer
    queryset = UserProfile.objects.all()
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    # @action(methods=['POST'], detail=False, serializer_class=)
    def temp(self,request):
        this_user= User.objects.get(username=request.data["user"]).id
        profile= UserProfile.objects.get(user=this_user)
        group = UserProfile.objects.get(user=this_user).employee_group.id
        door_obj = Door.objects.get(qr=request.data["door"])
        door = Door.objects.get(qr=request.data["door"])
        shift = ShiftAssignment.objects.filter(group=group,\
        starting_date__lte=timezone.now(), ending_date__gte=timezone.now()).first().shift.shift
        access, message = access_checker(user=this_user, door=door)
        
        try:
            latch = Latch.objects.get(door= door_obj)
        except:
            print("Latch not found")
        if access:
            send_mqtt_latch(latch=latch, value=True, delay=2, delayed_value=False)
        response={"access": access, "message": message}
        return Response(response,status=status.HTTP_200_OK)