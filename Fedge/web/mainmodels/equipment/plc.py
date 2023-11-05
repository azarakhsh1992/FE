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
    bereich = models.CharField(choices= Bereich.choices, max_length=1, editable=False)
    segment = models.CharField(max_length=1, editable=False)
    anlage = models.CharField(max_length=4, editable=False)
    arg_sps = models.CharField(max_length=1, editable=False)
    pultbereich_sk = models.CharField(max_length=1, editable=False)
    station = models.CharField(max_length=4, editable=False)
    def save(self, *args, **kwargs):
        self.bereich = self.cabinet.bereich
        self.segment = self.cabinet.segment
        self.anlage = self.cabinet.anlage
        self.arg_sps = self.cabinet.arg_sps
        self.pultbereich_sk = self.cabinet.pultbereich_sk
        self.station = self.cabinet.station
        self.profinet_name = str(self.cabinet.profinet_name) + str(self.funktionseinheit)
        super(PLC, self).save(*args, **kwargs)