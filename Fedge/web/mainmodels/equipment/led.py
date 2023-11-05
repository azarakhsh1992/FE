from django.db import models
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device
from .plc import PLC
    
        
        

class LED (Device):
    module_type = "LED"
    door = models.ForeignKey(Door, related_name='led', on_delete=models.CASCADE)
    class Meta:
        pass


class LedValue(models.Model):
    led = models.ForeignKey(LED, on_delete=models.CASCADE, related_name='ledvalue')
    value = models.BooleanField(default=False)
    #timestamp = models.DateTimeField()