from django.db import models
from ..modules.iolink import Io_link
from ..cabinetlevel.doors import Door
from ..iolmodules.iolmodule import Iol_Module
        
        
        
class Door_sensor (Iol_Module):
    value = models.BooleanField(default=False)
    module_type = "Door Sensor"

    class Meta:
        pass