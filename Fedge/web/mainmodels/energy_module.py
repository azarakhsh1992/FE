from django.db import models
from .cabinets import Cabinet
from .iolink import Io_link
from .doors import Door
from .Ports import Ports

class Energy_sensor (models.Model):
    
    geraet = models.CharField(max_length=3)
    class Module_type (models.TextChoices):
        ENERGY_SENSOR = 'ENERGY_SENSOR', 'Energy Measurement Module'
    module_type = models.CharField (choices= Module_type.choices, max_length=15)
    profinet_address = models.GenericIPAddressField(default=None, unique=True)
    serial_number = models.CharField(max_length=50, unique=True)
    cabinet = models.ForeignKey(Cabinet, on_delete=models.CASCADE)
    def save(self, *args, **kwargs):
        self.bereich = self.cabinet.bereich
        self.segment = self.cabinet.segment
        self.anlage = self.cabinet.anlage
        self.arg_sps = self.cabinet.arg_sps
        self.pultbereich_sk = self.cabinet.pultbereich_sk
        self.station = self.cabinet.station
        self.funktionseinheit = self.cabinet.funktionseinheit
        self.profinet_name = str(self.cabinet.profinet_name) + str(self.geraet)
        super(Energy_sensor, self).save(*args, **kwargs)
    
    profinet_name = models.CharField(max_length=18, editable=False, default=None)
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
    funktionseinheit = models.CharField(max_length=3, editable=False)