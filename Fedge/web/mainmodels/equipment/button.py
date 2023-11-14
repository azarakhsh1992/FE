from django.db import models

from ..cabinetlevel.doors import Door
from .plc import PLC
from ..equipment.devices import Device



class DoorButton(Device):

    module_type = "Door Button"
    device_door=models.OneToOneField(Door, related_name='doorbutton', on_delete=models.CASCADE)
    def save(self, *args, **kwargs):
        self.this_module_type=self.module_type
        return super().save(*args, **kwargs)
    class Meta:
        pass



class ButtonValue(models.Model):
    time = models.DateTimeField(primary_key=True, auto_now=True)
    doorbutton = models.ForeignKey(DoorButton, on_delete=models.CASCADE, related_name='buttonvalue')
    value = models.BooleanField(null=True)
    fault = models.BooleanField(default=False)