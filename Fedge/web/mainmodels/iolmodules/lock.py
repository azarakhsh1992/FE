from django.db import models
from ..modules.iolink import Iolink
from ..cabinetlevel.doors import Door
from ..iolmodules.iolmodule import Iol_Module


class LockactuatorDevice(Iol_Module):
    module_type = "Lock actuator"

    class Meta:
        pass


class LockactuatorValue(models.Model):
    lockactuatordevice = models.ForeignKey(LockactuatorDevice, on_delete=models.CASCADE,
                                           related_name='lockactuatorvalue')
    value = models.BooleanField(default=False)
    timestamp = models.DateTimeField()
