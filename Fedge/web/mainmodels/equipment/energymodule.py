from django.db import models
from ..cabinetlevel.cabinets import Cabinet, Rack
from .plc import PLC
from ..cabinetlevel.doors import Door
from .devices import Device,TimescaleModel
from django.core.exceptions import ValidationError



class EnergySensor(Device):
    this_module_type = 'Energy Measurement Module'

    class IO_Module(models.TextChoices):
        EM_1 = 'EM_1', 'EM_1'
        EM_2 = 'EM_2', 'EM_2'

    class MeasuringEnvironment(models.TextChoices):
        EM1 = 'EM1', 'EM1'
        EM2 = 'EM2', 'EM2'
    measuring_environment = models.CharField(choices=MeasuringEnvironment.choices, default=None, max_length=4, unique=True)
    device_io_module = models.CharField(choices=IO_Module.choices,editable=False, max_length=8,null=False)
    device_port = None
    def clean(self):
        if self.rack.name !="Energy":
            raise ValidationError("Wrong selection: select Energy rack")
        elif Device.objects.filter(port=self.device_port, io_module=self.device_io_module, plc=self.plc).exclude(pk=self.pk).exists():
            raise ValidationError("A device with this combination of port, io_module, and plc already exists.")
        elif self.bmk!=None and len(self.bmk) != 4:
            raise ValidationError("bmk must have exactly 4 characters")
        elif self.geraet!=None and len(self.geraet) != 3:
            raise ValidationError("Geraet must have exactly 3 characters")

    def save(self, *args, **kwargs):
        if self.measuring_environment =="EM1":
            self.device_io_module= "EM_1"
        elif self.measuring_environment == "EM2":
            self.device_io_module = "EM_2"
        self.module_type=self.this_module_type
        self.io_module=self.device_io_module
        self.port=self.device_port
        self.full_clean()
        super(EnergySensor, self).save(*args, **kwargs)
    class Meta:
        pass


class EnergySensorValue(TimescaleModel):
    energysensor = models.ForeignKey(EnergySensor, on_delete=models.CASCADE, related_name='energysensorvalue')
    energy_value = models.FloatField(null=True)
    energy_unit = models.CharField(default='KWh', max_length=4)
    power_value = models.FloatField(null=True)
    power_unit = models.CharField(default='KW', max_length=4)
    valid = models.BooleanField(null=True)
    def __str__(self):
        return ('Cabinet: '+self.energysensor.rack.cabinet.profinet_name + ', Module: '+self.energysensor.measuring_environment)
