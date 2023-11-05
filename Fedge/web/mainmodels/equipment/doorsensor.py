from django.db import models
from ..modules.plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device


class DoorSensor(Device):
    module_type = "Door Sensor"
    # door = models.OneToOneField(Door, related_name='parentdoor', on_delete=models.CASCADE)
    class Meta:
        pass


class DoorsensorValue(models.Model):
    doorsensordevice = models.ForeignKey(DoorSensor, on_delete=models.CASCADE, related_name='door_sensor_value')
    value = models.BooleanField(default=False)
    timestamp = models.DateTimeField()
