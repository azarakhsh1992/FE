import uuid
from typing import Any
from django.db import models
from ..cabinetlevel.cabinets import Cabinet, Rack
from django.core.exceptions import ValidationError



class Door(models.Model):

    class Direction(models.TextChoices):
        Front = 'Front', 'Front'
        Rear = 'Rear', 'Rear'
        NETWORK = 'Network', 'Network rack'
        ENERGY = 'Energy', 'Energy rack'
    direction = models.CharField(choices=Direction.choices,max_length=32, null=False)
    rack = models.ForeignKey(Rack, related_name='doors', on_delete=models.CASCADE, null=False)
    qr = models.CharField(max_length=32, unique=True, blank=True, editable=False, null=False)
    def __str__(self):
        return ('Cabinet: '+self.rack.cabinet.profinet_name+' Rack: '+self.rack.name + ' ,'+ self.direction)
    def clean(self):
        if self.rack.name =="Network" and self.direction != "Network":
            raise ValidationError("Wrong selection: The door must be 'Network rack' since you have chosen the Network for the rack.")
        if self.rack.name =="Energy" and self.direction != "Energy":
            raise ValidationError("Wrong selection: The door must be 'Energy rack' since you have chosen the Energy for the rack.")
        elif self.rack.name in ["Edge_A","Edge_B","Cooling"] and self.direction in ["Network", "Energy"]:
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
        
        
