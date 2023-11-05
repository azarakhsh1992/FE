import uuid
from typing import Any
from django.db import models
from ..cabinetlevel.cabinets import Cabinet, Rack


class Door(models.Model):

    class Direction(models.TextChoices):
        Front = 'Front', 'Front'
        Rear = 'Rear', 'Rear'
    direction = models.CharField(choices=Direction.choices,max_length=16, null=False)
    rack = models.ForeignKey(Rack, related_name='racks', on_delete=models.CASCADE, null=False)
    cabinet = models.ForeignKey(Cabinet, related_name='cabinet', on_delete=models.CASCADE, null=False)
    qr = models.CharField(max_length=32, unique=True, blank=True, editable=False, null=False)

    class Meta:
        unique_together = ('direction', 'rack', 'cabinet')
    def __str__(self):
        return ('Cabinet: '+self.cabinet.profinet_name+' Rack: '+self.rack.name)
    def save(self, *args, **kwargs):
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