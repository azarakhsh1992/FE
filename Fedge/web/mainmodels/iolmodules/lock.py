from django.db import models
from ..modules.iolink import Io_link
from ..cabinetlevel.doors import Door
from ..iolmodules.iolmodule import Iol_Module
    
    
    
class Lock_actuator (Iol_Module):

    value = models.BooleanField(default=False)
    module_type = "Lock actuator"

    class Meta:
        pass