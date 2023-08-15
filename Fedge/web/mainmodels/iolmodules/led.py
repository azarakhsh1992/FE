from django.db import models
from ..modules.iolink import Io_link
from ..cabinetlevel.doors import Door
from ..iolmodules.iolmodule import Iol_Module
    
        
        

class Led (Iol_Module):
    module_type = "LED"
    value = models.BooleanField(default=False)        
    class Meta:
        pass