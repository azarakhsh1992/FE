from django.db import models
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Rack
from ..equipment.devices import Device, TimescaleModel
from .plc import PLC
from django.core.exceptions import ValidationError



class LED (Device):
    this_module_type = "LED"
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
    class DoorDirection(models.TextChoices):
        Front = 'Front', 'Front'
        Rear = 'Rear', 'Rear'
        NETWORK = 'Network', 'Network rack'
        ENERGY = 'Energy', 'Energy rack'
    door_direction = models.CharField(choices=DoorDirection.choices,max_length=32, null=False)
    door = models.OneToOneField(Door, related_name='leds', on_delete=models.CASCADE, editable=False)
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
    def __str__(self):
        return ('Cabinet: '+self.led.door.rack.cabinet.profinet_name+', Rack: '+self.led.door.rack.name + ', Door: '+ self.led.door.direction)


class LedValueCases(models.Model):
    class Description(models.TextChoices):
        A = "default", "Door is closed and available for user"
        B = "wait_button", "waiting for the door button being pushed"
        C = "access_denied", "Access Denied for this user because they don't have access to this door"
        D = "door_not_locked", "Door is not locked after user requested to log out"
        E = "access_granted", "Access granted for this user and door opened"
        F = "default_open", "Door is open and not available for user"
        G = "request_expired", "user has requested an access but the button not pushed"
    description = models.CharField(choices=Description.choices,max_length=24, unique=True)
    functionality = models.TextField(max_length=128, blank=True)
    value = models.IntegerField(default=0)
