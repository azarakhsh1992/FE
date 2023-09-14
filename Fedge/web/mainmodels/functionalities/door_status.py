from django.db import models
from ..cabinetlevel.cabinets import Cabinet
from ..modules.iolink import Iolink
from ..cabinetlevel.doors import Door
from ..iolmodules.temperaturesensordevice import TemperaturesensorDevice
from ..userrelated.users import User
from ..iolmodules.doorsensor import DoorsensorDevice

def is_safe(this_cabinet):
    return True

def Check_door(this_cabinet):
    this_iolink = Iolink.objects.get(cabinet = this_cabinet)
    door_sensor = DoorsensorDevice.objects.get(iolink = this_iolink)
    temp_sensor = TemperaturesensorDevice.objects.get(iolink = this_iolink)
    print(door_sensor.value)
    if door_sensor.value: #value is True : door is closed
        return True
    else:
        return False