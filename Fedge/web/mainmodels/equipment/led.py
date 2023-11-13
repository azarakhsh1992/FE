from django.db import models
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device
from .plc import PLC
    
        
        

class LED (Device):
    module_type = "LED"
    device_door = models.ForeignKey(Door, related_name='led', on_delete=models.CASCADE)
    def save(self, *args, **kwargs):
        self.this_module_type =self.module_type
        self.door= self.device_door.cabinet.profinet_name+self.device_door.rack+self.device_door.direction
        return super().save(*args, **kwargs)
    class Meta:
        pass


class LedValue(models.Model):
    time = models.DateTimeField(primary_key=True, auto_now=True)
    led = models.ForeignKey(LED, on_delete=models.CASCADE, related_name='ledvalue')
    value = models.BooleanField(default=False)