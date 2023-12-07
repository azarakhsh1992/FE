from django.db import models
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Rack
from ..equipment.devices import Device, TimescaleModel
from .plc import PLC
from django.core.exceptions import ValidationError



class LED (Device):
    this_module_type = "LED"
    class IO_Module(models.TextChoices):
        DO_1 = 'DO_16', 'DO 16-Kanal'
        DO_2 = 'DO_8', 'DO 8-Kanal'
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
    class DoorDirection(models.TextChoices):
        Front = 'Front', 'Front'
        Rear = 'Rear', 'Rear'
        NETWORK = 'Network', 'Network rack'
        ENERGY = 'Energy', 'Energy rack'
    door_direction = models.CharField(choices=DoorDirection.choices,max_length=32, null=False)
    door = models.ForeignKey(Door, related_name='leds', on_delete=models.CASCADE, editable=False)
    device_io_module = models.CharField(choices=IO_Module.choices,editable=True, max_length=8,null=False)
    device_port = models.CharField(choices=Port.choices,editable=True, max_length=4,null=False)
    def clean(self):
        if self.rack.name in ["Edge_A","Edge_B","Cooling"] and self.door_direction not in ["Front", "Rear"]:
            raise ValidationError("Wrong selection: The door must be either 'Front' or 'Rear' for this rack.")

        elif self.rack.name =="Energy" and self.door_direction != "Energy":
            raise ValidationError("Wrong selection: The door must be 'Energy rack' since you have chosen the Energy for the rack.")
        elif self.rack.name =="Network" and self.door_direction != "Network":
            raise ValidationError("Wrong selection: The door must be 'Network rack' since you have chosen the Network for the rack.")
        elif Door.objects.filter(direction=self.door_direction, rack=Rack.objects.get(cabinet=self.plc.cabinet, name = self.rack.name)).exists()==False:
            raise ValidationError("This door does not exist")
        elif self.device_io_module == "DO_8" and self.device_port in ["P9", "P10", "P11", "P12", "P13", "P14", "P15", "P16"]:
            raise ValidationError("This module only has 8 ports. Please select a port number from P1 to P8")
        
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
        self.door=Door.objects.get(direction=self.door_direction, rack=Rack.objects.get(cabinet=self.plc.cabinet, name = self.rack.name))
        super(LED, self).save(*args, **kwargs)
    # class Meta:
    #     unique_together = ["door","rack"]

class LedValue(TimescaleModel):
    led = models.ForeignKey(LED, on_delete=models.CASCADE, related_name='ledvalue')
    value = models.IntegerField(null=True)
    valid = models.BooleanField(default=None)