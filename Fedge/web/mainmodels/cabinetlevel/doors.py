import uuid
from typing import Any
from django.db import models
from ..cabinetlevel.cabinets import Cabinet, Rack
from django.core.exceptions import ValidationError



class Door(models.Model):

    class Direction(models.TextChoices):
        Front = 'Front', 'Front'
        Rear = 'Rear', 'Rear'
        NE = 'NetworkOrEnergy', 'Network/Energy'
    direction = models.CharField(choices=Direction.choices,max_length=32, null=False)
    rack = models.ForeignKey(Rack, related_name='doors', on_delete=models.CASCADE, null=False)
    qr = models.CharField(max_length=32, unique=True, blank=True, editable=False, null=False)
    def __str__(self):
        return ('Cabinet: '+self.rack.cabinet.profinet_name+' Rack: '+self.rack.name + self.direction)
    def clean(self):
        if self.rack.name in ["Energy", "Network"] and self.direction in["Front", "Rear"]:
            raise ValidationError("Wrong selection: Select Network/Energy can be selected for this rack")
        elif self.rack.name in ["Edge_A","Edge_B","Cooling"] and self.direction== "NetworkOrEnergy":
            raise ValidationError("Wrong selection: Select either Front or Rear as direction for this rack")
        else:
            pass
    def save(self, *args, **kwargs):
        self.cabinet=self.rack.cabinet
        doors = Door.objects.all()
        condition = True
        # self.qr = uuid.uuid4().hex[:20]
        generatedqr = uuid.uuid4().hex[:20]
        if doors:
            for door in doors:
                while condition:
                    if generatedqr == door.qr:
                        generatedqr = uuid.uuid4().hex[:20]
                        condition = True
                    else:
                        condition = False
        self.qr = generatedqr
        # print(generatedqr)
        super(Door, self).save(*args, **kwargs)
        
    class Meta:
        unique_together = ('direction', 'rack')
        
        
