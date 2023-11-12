from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..equipment.devices import Device


class TemperatureSensor(Device):
    module_type = "temperature_sensor"
    class MeasuringEnvironment(models.TextChoices):
        Edge_A_top = 'Edge_A_top', 'Edge_A_top'
        Edge_A_middle = 'Edge_A_middle', 'Edge_A_middle'
        Edge_A_bottom = 'Edge_A_bottom', 'Edge_A_bottom'
        Edge_B_top = 'Edge_B_top', 'Edge_B_top'
        Edge_B_middle = 'Edge_B_middle', 'Edge_B_middle'
        Edge_B_bottom = 'Edge_B_bottom', 'Edge_B_bottom'
        Network = 'Network', 'Network'
        Energy = 'Energy', 'Energy'
    measuring_env = models.CharField(choices=MeasuringEnvironment.choices, default=None, max_length=16, unique=True)
    def save(self, *args, **kwargs):
        self.this_module_type=self.module_type
        return super().save(*args, **kwargs)
    class Meta:
        pass

class TemperatureSensorValue(models.Model):
    temperaturesensordevice = models.ForeignKey(TemperatureSensor, on_delete=models.CASCADE, related_name='temperaturesensorvalue')
    time = models.DateTimeField(primary_key=True, auto_now=True)
    tempvalue = models.FloatField(default=0)
    tempvalue_min = models.FloatField(default=0)
    tempvalue_max = models.FloatField(default=0)
    humidvalue = models.FloatField(default=0)
