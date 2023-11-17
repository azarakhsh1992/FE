from django.db import models

from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Rack
from .plc import PLC
from ..equipment.devices import Device



class DoorButton(Device):

    module_type = "Door Button"
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
    device_door = models.OneToOneField(Door, related_name='doorbuttons', on_delete=models.CASCADE, editable=False)
    def save(self, *args, **kwargs):
        # self.device_door= Door.objects.get(direction=self.door_direction)
        self.device_door=Door.objects.get(direction=self.door_direction, rack=Rack.objects.get(cabinet=self.plc.cabinet, name = self.rack_name))
        self.this_module_type=self.module_type
        return super().save(*args, **kwargs)
    class Meta:
        pass


class ButtonValue(models.Model):
    time = models.DateTimeField(primary_key=True, auto_now=True)
    doorbutton = models.ForeignKey(DoorButton, on_delete=models.CASCADE, related_name='buttonvalue')
    value = models.BooleanField(null=True)
    fault = models.BooleanField(default=False)