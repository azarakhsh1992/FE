from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..equipment.devices import Device,TimescaleModel
from django.core.exceptions import ValidationError
from django import forms


class DoorSensor(Device):
    this_module_type = "Door Sensor"
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
    class DoorDirection(models.TextChoices):
        Front = 'Front', 'Front'
        Rear = 'Rear', 'Rear'
        NETWORK = 'Network', 'Network rack'
        ENERGY = 'Energy', 'Energy rack'
        
    door_direction = models.CharField(choices=DoorDirection.choices,max_length=32, null=False)
    door = models.OneToOneField(Door, related_name='doorsensors', on_delete=models.CASCADE, editable=False)
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
        elif self.device_io_module == "DI_2" and self.device_port not in ["P1", "P2"]:
            raise ValidationError("This module only has 2 ports. Please select a port number of P1 or P2")
        
        
        elif Device.objects.filter(port=self.device_port, io_module=self.device_io_module, plc=self.plc).exclude(pk=self.pk).exists():
            raise ValidationError("A device with this combination of port, io_module, and plc already exists.")
        elif self.bmk!=None and len(self.bmk) != 4:
            raise ValidationError("bmk must have exactly 4 characters")
        elif self.geraet!=None and len(self.geraet) != 3:
            raise ValidationError("Geraet must have exactly 3 characters")
        
        #TODO: This function does not work, Error: DoorSensor has no door.
        # elif self.door and DoorSensor.objects.filter(door=self.door).exclude(pk=self.pk).exists():
        #     raise ValidationError("A door sensor has already been assigned to this door")
    def save(self, *args, **kwargs):
        self.full_clean()
        self.door=Door.objects.get(direction=self.door_direction, rack=Rack.objects.get(cabinet=self.plc.cabinet, name = self.rack.name))
        self.module_type=self.this_module_type
        self.port=self.device_port
        self.io_module=self.device_io_module
        super(DoorSensor, self).save(*args, **kwargs)



class DoorsensorValue(TimescaleModel):
    doorsensor = models.ForeignKey(DoorSensor, on_delete=models.CASCADE, related_name='doorsensorvalue',)
    value = models.CharField(default="closed",max_length=8)
    valid=models.BooleanField(null=True, default=True)
    def __str__(self):
        return ('Cabinet: '+self.doorsensor.door.rack.cabinet.profinet_name+', Rack: '+self.doorsensor.door.rack.name + ', Door: '+ self.doorsensor.door.direction)

