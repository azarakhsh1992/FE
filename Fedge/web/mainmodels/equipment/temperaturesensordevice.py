from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..equipment.devices import Device


class TemperatureSensor(Device):

    class MeasuringEnvironment(models.TextChoices):
        Edge_A_top = 'Edge_A_top', 'Edge_A_top'
        Edge_A_middle = 'Edge_A_middle', 'Edge_A_middle'
        Edge_A_bottom = 'Edge_A_bottom', 'Edge_A_bottom'
        Edge_B_top = 'Edge_B_top', 'Edge_B_top'
        Edge_B_middle = 'Edge_B_middle', 'Edge_B_middle'
        Edge_B_bottom = 'Edge_B_bottom', 'Edge_B_bottom'
        Network = 'Network', 'Network'
        Energy = 'Energy', 'Energy'
    measuring_env = models.CharField(choices=MeasuringEnvironment.choices, default=None, max_length=16)
    module_type = "temperature and humidity sensor module"

class TemperatureSensorValue(models.Model):
    temperaturesensordevice = models.ForeignKey(TemperatureSensor, on_delete=models.CASCADE, related_name='temperaturesensorvalue')
    tempvalue = models.FloatField(default=0)
    tempvalue_min = models.FloatField(default=0)
    tempvalue_max = models.FloatField(default=0)
    temp_unit = models.CharField(default='°C', max_length=4, editable=False)
    humidvalue = models.FloatField(default=0)
    humid_unit = models.CharField(default='%', max_length=2, editable=False)
    timestamp = models.DateTimeField()
