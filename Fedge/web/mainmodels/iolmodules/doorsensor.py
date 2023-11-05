from django.db import models
from ..modules.plc import PLC
from ..cabinetlevel.doors import Door
from ..iolmodules.iolmodule import Iol_Module


class DoorsensorDevice(Iol_Module):
    module_type = "Door Sensor"
    # door = models.OneToOneField(Door, related_name='parentdoor', on_delete=models.CASCADE)
    class Meta:
        pass


class DoorsensorValue(models.Model):
    doorsensordevice = models.ForeignKey(DoorsensorDevice, on_delete=models.CASCADE, related_name='doorsensorvalue')
    value = models.BooleanField(default=False)
    timestamp = models.DateTimeField()
