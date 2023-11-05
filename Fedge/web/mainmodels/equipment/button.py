from django.db import models

from ..cabinetlevel.doors import Door
from .plc import PLC
from ..equipment.devices import Device



class DoorButton(Device):
    module_type = "Door Button"
    # door = models.OneToOneField(Door, related_name='parentdoor', on_delete=models.CASCADE)
    class Meta:
        pass



class ButtonValues(models.Model):
    doorbutton = models.ForeignKey(DoorButton, on_delete=models.CASCADE, related_name='button_value')
    value = models.BooleanField(default=False)
    timestamp = models.DateTimeField()