from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..equipment.devices import Device,TimescaleModel
from django.core.exceptions import ValidationError
from django import forms


class ACM(Device):
    this_module_type = "AC Alarm Sensor"
    class IO_Module(models.TextChoices):
        DI_1 = 'DI1_16', 'DI1 16-Kanal'
        DI_2 = 'DI2_16', 'DI2 16-Kanal'
        DI_3 = 'DI_2', 'DI 2-Kanal'
    class Port(models.TextChoices):
        P1 = 'P1', 'P1'
        P2 = 'P2', 'P2'
        P3 = 'P3', 'P3'
        P4 = 'P4', 'P4'
        P5 = 'P5', 'P5'
        P6 = 'P6', 'P6'
        P7 = 'P7', 'P7'
        P8 = 'P8', 'P8'
        P9 = 'P9', 'P9'
        P10 = 'P10', 'P10'
        P11 = 'P11', 'P11'
        P12 = 'P12', 'P12'
        P13 = 'P13', 'P13'
        P14 = 'P14', 'P14'
        P15 = 'P15', 'P15'
        P16 = 'P16', 'P16'
    class MeasuringEnvironment(models.TextChoices):
        AC_1 = 'AC_1', 'AC_1'
        AC_2 = 'AC_2', 'AC_2'
    measuring_environment = models.CharField(choices=MeasuringEnvironment.choices, default=None, max_length=16, unique=True)
    device_io_module = models.CharField(choices=IO_Module.choices,editable=True, max_length=8,null=False)
    device_port = models.CharField(choices=Port.choices,editable=True, max_length=4,null=False)
    
    def clean(self):
        if self.rack.name in ["Edge_A","Edge_B","Network","Energy"]:
            raise ValidationError("Wrong selection: The rack must be the Cooling rack.")
        
        elif self.device_io_module == "DI_2" and self.device_port not in ["P1", "P2"]:
            raise ValidationError("This module only has 2 ports. Please select a port number of P1 or P2")
        
        elif Device.objects.filter(port=self.device_port, io_module=self.device_io_module, plc=self.plc).exclude(pk=self.pk).exists():
            devices= Device.objects.filter(plc=self.plc).exclude(pk=self.pk)
            x=1
            y={}
            for device in devices:
                if device.io_module in ["DI1_16", "DI2_16", "DI_2"]:
                    y.update({f"{x}":{device.io_module:device.port}})
                    x+=1
            message= f"these ports are occupied:{y}"
            raise ValidationError(f"A device with this combination of port, io_module, and plc already exists.{message}")
        elif self.bmk!=None and len(self.bmk) != 4:
            raise ValidationError("bmk must have exactly 4 characters")
        elif self.geraet!=None and len(self.geraet) != 3:
            raise ValidationError("Geraet must have exactly 3 characters")
        
    def save(self, *args, **kwargs):
        self.full_clean()
        self.module_type=self.this_module_type
        self.port=self.device_port
        self.io_module=self.device_io_module
        super(ACM, self).save(*args, **kwargs)

class ACMValue(TimescaleModel):
    acm = models.ForeignKey(ACM, on_delete=models.CASCADE, related_name='doorsensorvalue',)
    value = models.BooleanField(null=True)
    valid=models.BooleanField(null=True, default=True)
    def __str__(self):
        return ('Cabinet: '+self.acm.plc.cabinet.profinet_name+', Rack: '+self.acm.rack.name)

