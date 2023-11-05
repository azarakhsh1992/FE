from django.db import models
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device
from .plc import PLC
    
        
        

class LedDevice (Device):
    module_type = "LED"
    # door = models.OneToOneField(Door, related_name='parent door', on_delete=models.CASCADE)
    class Meta:
        pass


class LedValue(models.Model):
    leddevice = models.ForeignKey(LedDevice, on_delete=models.CASCADE, related_name='ledvalue')
    value = models.BooleanField(default=False)
    timestamp = models.DateTimeField()