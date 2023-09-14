from django.db import models

from ..cabinetlevel.doors import Door
from ..modules.iolink import Iolink
from ..iolmodules.iolmodule import Iol_Module



class ButtonDevice(Iol_Module):
    module_type = "Door Button"
    # door = models.OneToOneField(Door, related_name='parentdoor', on_delete=models.CASCADE)
    class Meta:
        pass



class ButtonValues(models.Model):
    btndevice = models.ForeignKey(ButtonDevice, on_delete=models.CASCADE, related_name='btnvalue')
    value = models.BooleanField(default=False)
    timestamp = models.DateTimeField()