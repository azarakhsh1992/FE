from django.db import models

from ..cabinetlevel.doors import Door
from .plc import PLC
from ..equipment.devices import Device



class DoorButton(Device):

    module_type = "Door Button"
    device_door=models.OneToOneField(Door, related_name='doorbutton', on_delete=models.CASCADE)
    def save(self, *args, **kwargs):
        self.this_module_type=self.module_type
        self.door = str(self.device_door.cabinet.profinet_name)+str(self.device_door.rack.name)+str(self.device_door.direction)
        return super().save(*args, **kwargs)
    class Meta:
        pass



class ButtonValues(models.Model):
    doorbutton = models.ForeignKey(DoorButton, on_delete=models.CASCADE, related_name='buttonvalue')
    value = models.BooleanField(default=False)
    #timestamp = models.DateTimeField()