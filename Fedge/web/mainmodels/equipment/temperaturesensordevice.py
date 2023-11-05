from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.devices import Device


class TemperaturesensorDevice(Device):

    class Measuringenv(models.TextChoices):
        IN = 'IN', 'inside'
        OUT = 'OUT', 'outside'

    measuring_env = models.CharField(choices=Measuringenv.choices, default="IN", max_length=8)
    module_type = "temperature and humidity sensor module"

    class Meta:
        pass


class TemperaturesensorValue(models.Model):
    temperaturesensordevice = models.ForeignKey(TemperaturesensorDevice, on_delete=models.CASCADE, related_name='temperaturesensorvalue')
    tempvalue = models.FloatField(default=0)
    humidvalue = models.FloatField(default=0)
    timestamp = models.DateTimeField()
