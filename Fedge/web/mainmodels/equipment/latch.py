from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device


class Latch(Device):
    module_type = "Latch"
    device_door=models.OneToOneField(Door, related_name='latch', on_delete=models.CASCADE)
    def save(self, *args, **kwargs):
        self.this_module_type=self.module_type
        return super().save(*args, **kwargs)
    class Meta:
        pass


class LatchValue(models.Model):
    time = models.DateTimeField(primary_key=True, auto_now=True)
    latch = models.OneToOneField(Latch, on_delete=models.CASCADE, related_name='latchvalue')
    value = models.BooleanField(null=True)
    fault = models.BooleanField(default=False)
