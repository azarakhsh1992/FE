from django.db import models
from .cabinets import Cabinet
from .iolink import Io_link
from .doors import Door
from .lock import Lock_actuator
from .led import Led
from .temperature_sensor import Temperature_sensor
from .users import User
from .door_sensor import Door_sensor

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