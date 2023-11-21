from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..equipment.devices import Device


class TemperatureSensor(Device):
    module_type = "Temperature Sensor"
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
        if self.measuring_env in['Edge_A_top','Edge_A_middle','Edge_A_bottom']:
            self.rack=Rack.objects.get(cabinet=self.plc.cabinet, name="Edge_A")
        elif self.measuring_env in ['Edge_B_top','Edge_B_middle','Edge_B_bottom']:
            self.rack=Rack.objects.get(cabinet=self.plc.cabinet, name="Edge_B")
        elif self.measuring_env == "Network":
            self.rack=Rack.objects.get(cabinet=self.plc.cabinet, name="Network")
        elif self.measuring_env == "Energy":
            self.rack=Rack.objects.get(cabinet=self.plc.cabinet, name="Energy")
        else:
            pass
        super().save(*args, **kwargs)
    class Meta:
        pass

class TemperatureSensorValue(models.Model):
    time = models.DateTimeField(primary_key=True, auto_now_add=True)
    temperaturesensordevice = models.ForeignKey(TemperatureSensor, on_delete=models.CASCADE, related_name='temperaturesensorvalue')
    tempvalue = models.FloatField(null=True)
    tempvalue_min = models.FloatField(null=True)
    tempvalue_max = models.FloatField(null=True)
    humidvalue = models.FloatField(null=True)
    valid = models.BooleanField(default=True)
