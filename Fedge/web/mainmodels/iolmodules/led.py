from django.db import models
from ..modules.iolink import Iolink
from ..cabinetlevel.doors import Door
from ..iolmodules.iolmodule import Iol_Module
    
        
        

class LedDevice (Iol_Module):
    module_type = "LED"
    class Meta:
        pass


class LedValue(models.Model):
    leddevice = models.ForeignKey(LedDevice, on_delete=models.CASCADE, related_name='ledvalue')
    value = models.BooleanField(default=False)
    timestamp = models.DateTimeField()