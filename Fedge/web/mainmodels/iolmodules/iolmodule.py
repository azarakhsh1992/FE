from django.db import models
from ..modules.plc import PLC
from ..cabinetlevel.doors import Door


class Iol_Module(models.Model):
    plc = models.ForeignKey(PLC, related_name='iolmodules', on_delete=models.CASCADE)

    bmk = models.CharField(max_length=3, default=None)
    serial_number = models.CharField(max_length=50, unique=True)
    manufacturer = models.CharField(max_length=50)
    profinet_address = models.GenericIPAddressField(default=None, unique=False, editable=False)
    profinet_name = models.CharField(max_length=22, editable=False, default=None)

    class Bereich(models.TextChoices):
        K = 'K', 'Karosseriebau'
        F = 'F', 'Fördertechnik'
        M = 'M', 'Montage'
        I = 'I', 'Inhouse Logistik'
        P = 'P', 'Presswerk'
        L = 'L', 'Lackiererei'
        B = 'B', 'Batteriefertigung'
        C = 'C', 'Komponente'

    bereich = models.CharField(choices=Bereich.choices, max_length=1, editable=False)
    segment = models.CharField(max_length=1, editable=False)
    anlage = models.CharField(max_length=4, editable=False)
    arg_sps = models.CharField(max_length=1, editable=False)
    pultbereich_sk = models.CharField(max_length=1, editable=False)
    station = models.CharField(max_length=4, editable=False)
    funktionseinheit = models.CharField(max_length=3, editable=False)
    geraet = models.CharField(max_length=3, editable=False)

    class Port_addresses(models.TextChoices):
        X1 = 'X1', 'X1'
        X2 = 'X2', 'X2'
        X3 = 'X3', 'X3'
        X4 = 'X4', 'X4'
        X5 = 'X5', 'X5'
        X6 = 'X6', 'X6'
        X7 = 'X7', 'X7'
        X8 = 'X8', 'X8'

    port = models.CharField(choices=Port_addresses.choices, default=None, max_length=5)

    def save(self, *args, **kwargs):
        self.bereich = self.plc.bereich
        self.segment = self.plc.segment
        self.anlage = self.plc.anlage
        self.arg_sps = self.plc.arg_sps
        self.pultbereich_sk = self.plc.pultbereich_sk
        self.station = self.plc.station
        self.funktionseinheit = self.plc.funktionseinheit
        self.geraet = self.plc.geraet
        self.profinet_name = str(self.plc.profinet_name) + str(self.geraet)
        self.profinet_address = self.plc.profinet_address
        super(Iol_Module, self).save(*args, **kwargs)

    class Meta:
        unique_together = ('port', 'plc')
