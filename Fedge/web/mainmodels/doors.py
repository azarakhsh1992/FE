from typing import Any
from django.db import models
from .cabinets import Cabinet


class Door(models.Model):
    cabinet = models.ForeignKey(Cabinet, on_delete=models.CASCADE)
    qr = models.CharField(max_length=20, default=None)
    name = models.CharField(max_length=50)
    def save(self, *args, **kwargs):
        self.profinet_name = str(self.cabinet.profinet_name) + str(self.name) 
        super(Door, self).save(*args, **kwargs)
    
    profinet_name = models.CharField(max_length=200, editable=False, default=None)
    
    class Direction(models.TextChoices):
        FRONT = "FRONT", "front"
        BACK = "BACK", "back"
    direction = models.CharField(choices=Direction.choices, default=None, max_length=20)
    
    class Section(models.TextChoices):
        NETWORK = "NETWORK", "IT Network"
        PS = "PS", "Powe supply"
        FE = "FE", "Factory Edge Server"
    section = models.CharField(choices=Section.choices, default=None, max_length=20)

# class QR_code(models.Model):
#     door =models.OneToOneField(Door, on_delete=models.CASCADE)
#     qr = models.CharField(max_length=20)