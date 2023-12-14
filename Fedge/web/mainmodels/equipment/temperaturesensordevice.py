from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..equipment.devices import Device, TimescaleModel
from django.core.exceptions import ValidationError



class TemperatureSensor(Device):
    this_module_type = "Temperature Sensor"
    class IO_Module(models.TextChoices):
        IOL_1 = 'IOL_1', 'IOL 1'
        IOL_2 = 'IOL_2', 'IOL 2'
        IOL_3 = 'IOL_3', 'IOL 3'
        IOL_4 = 'IOL_4', 'IOL 4'
    class Port(models.TextChoices):
        P1 = 'P1', 'P1'
        P2 = 'P2', 'P2'
        P3 = 'P3', 'P3'
        P4 = 'P4', 'P4'
    class MeasuringEnvironment(models.TextChoices):
        Edge_A_top = 'Edge_A_top', 'Edge_A_top'
        Edge_A_middle = 'Edge_A_middle', 'Edge_A_middle'
        Edge_A_bottom = 'Edge_A_bottom', 'Edge_A_bottom'
        Edge_B_top = 'Edge_B_top', 'Edge_B_top'
        Edge_B_middle = 'Edge_B_middle', 'Edge_B_middle'
        Edge_B_bottom = 'Edge_B_bottom', 'Edge_B_bottom'
        Network = 'Network', 'Network'
        Energy = 'Energy', 'Energy'
    measuring_environment = models.CharField(choices=MeasuringEnvironment.choices, default=None, max_length=16, unique=True)
    device_io_module = models.CharField(choices=IO_Module.choices,editable=True, max_length=8,null=False)
    device_port = models.CharField(choices=Port.choices,editable=True, max_length=4,null=False)
    critical_value = models.FloatField(default=70,editable=True)
    def clean(self):
        if self.measuring_environment in ["Edge_A_top","Edge_A_middle","Edge_A_bottom"] and self.rack.name !="Edge_A":
            raise ValidationError("Wrong selection: Rack and measuring environment do not match")
        elif self.measuring_environment in ["Edge_B_top","Edge_B_middle","Edge_B_bottom"] and self.rack.name !="Edge_B":
            raise ValidationError("Wrong selection: Rack and measuring environment do not match")
        elif self.measuring_environment=="Network" and self.rack.name !="Network":
            raise ValidationError("Wrong selection: Rack and measuring environment do not match")
        elif self.measuring_environment=="Energy" and self.rack.name !="Energy":
            raise ValidationError("Wrong selection: Rack and measuring environment do not match")
        elif Device.objects.filter(port=self.device_port, io_module=self.device_io_module, plc=self.plc).exclude(pk=self.pk).exists():
            raise ValidationError("A device with this combination of port, io_module, and plc already exists.")
        elif self.bmk!=None and len(self.bmk) != 4:
            raise ValidationError("bmk must have exactly 4 characters")
        elif self.geraet!=None and len(self.geraet) != 3:
            raise ValidationError("Geraet must have exactly 3 characters")

    def save(self, *args, **kwargs):
        self.full_clean()
        self.module_type=self.this_module_type
        self.port=self.device_port
        self.io_module=self.device_io_module
        super(TemperatureSensor, self).save(*args, **kwargs)
    class Meta:
        pass


class TemperatureSensorValue(TimescaleModel):
    temperaturesensor = models.ForeignKey(TemperatureSensor, on_delete=models.CASCADE, related_name='temperaturesensorvalue')
    tempvalue = models.FloatField(null=True)
    tempvalue_min = models.FloatField(null=True)
    tempvalue_max = models.FloatField(null=True)
    humidvalue = models.FloatField(null=True)
    valid = models.BooleanField(null = True)
    def __str__(self):
        return ('Cabinet: '+self.temperaturesensor.rack.cabinet.profinet_name+', Rack: '+self.temperaturesensor.rack.name + ', Section:'+ self.temperaturesensor.measuring_environment.replace("Edge_A_","").replace("Edge_B_",""))
