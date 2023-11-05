from django.db import models
from ..cabinetlevel.cabinets import Cabinet
from ..equipment.plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.temperaturesensordevice import TemperatureSensor
from ..userrelated.users import User
from ..equipment.doorsensor import DoorSensor

def is_safe(this_cabinet):
    return True

def Check_door(this_cabinet):
    this_plc = PLC.objects.get(cabinet = this_cabinet)
    door_sensor = DoorSensor.objects.get(plc = this_plc)
    temp_sensor = TemperatureSensor.objects.get(plc = this_plc)
    print(door_sensor.value)
    if door_sensor.value: #value is True : door is closed
        return True
    else:
        return False