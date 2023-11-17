from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Rack
from ..equipment.devices import Device

class Latch(Device):
    module_type = "Latch"
    class DoorDirection(models.TextChoices):
        Front = 'Front', 'Front'
        Rear = 'Rear', 'Rear'
        NE = 'NetworkOrEnergy', 'Network/Energy'
    door_direction = models.CharField(choices=DoorDirection.choices,max_length=32, null=False)
    class Rack_name(models.TextChoices):
        Edge_A = "Edge_A", "Edge_A"
        Edge_B = "Edge_B", "Edge_B"
        Network = "Network", "Network"
        Energy = "Energy", "Energy"
        Cooling = "Cooling", "Cooling"
    rack_name = models.CharField(choices=Rack_name.choices, default=None, max_length=16, null=False)
    device_door = models.OneToOneField(Door, related_name='latchs', on_delete=models.CASCADE, editable=False)
    def save(self, *args, **kwargs):
        # self.device_door= Door.objects.get(direction=self.door_direction)
        self.device_door=Door.objects.get(direction=self.door_direction, rack=Rack.objects.get(cabinet=self.plc.cabinet, name = self.rack_name))
        self.this_module_type=self.module_type
        return super().save(*args, **kwargs)
    class Meta:
        pass

class LatchValue(models.Model):
    time = models.DateTimeField(primary_key=True, auto_now=True)
    latch = models.ForeignKey(Latch, on_delete=models.CASCADE, related_name='latchvalue')
    value = models.CharField(max_length=8,null=True)
    valid = models.BooleanField(default=True)
