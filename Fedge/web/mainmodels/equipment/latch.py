from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device


class Latch(Device):
    module_type = "Lock actuator"
    device_door=models.OneToOneField(Door, related_name='latch', on_delete=models.CASCADE)
    def save(self, *args, **kwargs):
        self.this_module_type=self.module_type
        self.door = self.device_door.cabinet.profinet_name+self.device_door.rack+self.device_door.direction
        return super().save(*args, **kwargs)
    class Meta:
        pass


class LatchValue(models.Model):
    latch = models.ForeignKey(Latch, on_delete=models.CASCADE, related_name='latchvalue')
    value = models.BooleanField(default=False)
    #timestamp = models.DateTimeField()
