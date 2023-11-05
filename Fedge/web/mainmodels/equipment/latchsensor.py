from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device


class LatchSensor(Device):
    module_type = "Latch Sensor"
    door = models.OneToOneField(Door, related_name='latchsensor', on_delete=models.CASCADE)
    class Meta:
        pass


class LatchSensorValue(models.Model):
    latchsensor = models.ForeignKey(LatchSensor, on_delete=models.CASCADE, related_name='latchsensorvalue')
    value = models.BooleanField(default=False)
    #timestamp = models.DateTimeField()
