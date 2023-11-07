from django.db import models
from ..cabinetlevel.cabinets import Cabinet
from .plc import PLC
from ..cabinetlevel.doors import Door
from .devices import Device


class EnergysensorDevice(Device):
    module_type = 'Energy Measurement Module'
    class MeasuringEnvironment(models.TextChoices):
        EM1 = 'EM1', 'EM1'
        EM2 = 'ME2', 'EM2'
    measuring_env = models.CharField(choices=MeasuringEnvironment.choices, default=None, max_length=4, unique=True)
    def save(self, *args, **kwargs):
        self.this_module_type=self.module_type
        return super().save(*args, **kwargs)
    class Meta:
        pass
class EnergySensorValue(models.Model):
    energysensordevice = models.ForeignKey(EnergysensorDevice, on_delete=models.CASCADE, related_name='energysensorvalue')
    energy_value = models.FloatField(default=0)
    energy_unit = models.CharField(default='KWh', max_length=4, editable=False)
    power_value = models.FloatField(default=0)
    power_unit = models.FloatField(default='KW', max_length=4, editable=False)
    timestamp = models.DateTimeField()
