from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device


class LatchSensor(Device):
    module_type = "Latch Sensor"
    device_door = models.OneToOneField(Door, related_name='latchsensor', on_delete=models.CASCADE)
    def save(self, *args, **kwargs):
        self.this_module_type=self.module_type
        self.door = self.device_door.cabinet.profinet_name+self.device_door.rack+self.device_door.direction
        return super().save(*args, **kwargs)
    class Meta:
        pass


class LatchSensorValue(models.Model):
    time = models.DateTimeField(primary_key=True, auto_now=True)
    latchsensor = models.ForeignKey(LatchSensor, on_delete=models.CASCADE, related_name='latchsensorvalue')
    value = models.BooleanField(null=True)
    fault=models.BooleanField(default=False)