from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device


class DoorSensor(Device):
    module_type = "Door Sensor"
    device_door = models.OneToOneField(Door, related_name='parentdoor', on_delete=models.CASCADE)
    def save(self, *args, **kwargs):
        self.this_module_type=self.module_type
        return super().save(*args, **kwargs)
    class Meta:
        pass

class DoorsensorValue(models.Model):
    time = models.DateTimeField(primary_key=True, auto_now=True)
    doorsensordevice = models.OneToOneField(DoorSensor, on_delete=models.CASCADE, related_name='doorsensorvalue',)
    value = models.BooleanField(null=True)
    fault=models.BooleanField(default=False)
