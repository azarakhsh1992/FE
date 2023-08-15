from django.db import models
from ..cabinetlevel.cabinets import Cabinet
from ..modules.iolink import Io_link
from ..cabinetlevel.doors import Door
from ..iolmodules.lock import Lock_actuator
from ..iolmodules.led import Led
from ..iolmodules.temperature_sensor import Temperature_sensor
from ..userrelated.users import User
from ..iolmodules.door_sensor import Door_sensor

def is_safe(this_cabinet):
    return True

def Check_door(this_cabinet):
    this_iolink = Io_link.objects.get(cabinet = this_cabinet)
    door_sensor = Door_sensor.objects.get(iolink = this_iolink)
    temp_sensor = Temperature_sensor.objects.get(iolink = this_iolink)
    print(door_sensor.value)
    if door_sensor.value: #value is True : door is closed
        return True
    else:
        return False