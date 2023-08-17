from django.db import models
from ..modules.iolink import Iolink
from ..cabinetlevel.doors import Door
from ..iolmodules.iolmodule import Iol_Module


class DoorsensorDevice(Iol_Module):
    module_type = "Door Sensor"
    class Meta:
        pass


class DoorsensorValue(models.Model):
    doorsensordevice = models.ForeignKey(DoorsensorDevice, on_delete=models.CASCADE, related_name='doorsensorvalue')
    value = models.BooleanField(default=False)
    timestamp = models.DateTimeField()
