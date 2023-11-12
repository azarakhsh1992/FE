from typing import Any
from django.db import models
from ..cabinetlevel.cabinets import Cabinet


class PLC (models.Model):

    cabinet = models.OneToOneField(Cabinet, related_name='plc', on_delete=models.CASCADE)
    module_type = 'PLC'
    funktionseinheit = models.CharField(max_length=3, default=None, help_text="it must have at least three character")
    ip_address = models.GenericIPAddressField(default=None, unique=True)
    serial_number = models.CharField(max_length=32, unique=True)
    profinet_name = models.CharField(max_length=18, editable=False, default=None, unique=True)
    class Bereich (models.TextChoices):
        K = 'K', 'Karosseriebau'
        F = 'F', 'Fördertechnik'
        M = 'M', 'Montage'
        I = 'I', 'Inhouse Logistik'
        P = 'P', 'Presswerk'
        L = 'L', 'Lackiererei'
        B = 'B', 'Batteriefertigung'
        C = 'C', 'Komponente'
    def save(self, *args, **kwargs):
        self.profinet_name = str(self.cabinet.profinet_name) + str(self.funktionseinheit)
        super(PLC, self).save(*args, **kwargs)