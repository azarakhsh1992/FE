from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door


class Device(models.Model):
    plc = models.ForeignKey(PLC, related_name='device', on_delete=models.CASCADE)
    #TODO: profinet name of the PLC must be checked; if Gerät and BMK is for Device, it should be editted as PLC to be Funktionseinheit
    bmk = models.CharField(max_length=3, default=None)
    serial_number = models.CharField(max_length=50, unique=True)
    manufacturer = models.CharField(max_length=50)
    ip_address = models.GenericIPAddressField(default=None, unique=False, editable=False)
    profinet_name = models.CharField(max_length=22, editable=False, default=None, unique=True)

    bereich = models.CharField(max_length=1, editable=False)
    segment = models.CharField(max_length=1, editable=False)
    anlage = models.CharField(max_length=4, editable=False)
    arg_sps = models.CharField(max_length=1, editable=False)
    pultbereich_sk = models.CharField(max_length=1, editable=False)
    station = models.CharField(max_length=4, editable=False)
    funktionseinheit = models.CharField(max_length=3, editable=False)
    geraet = models.CharField(max_length=3, editable=False)

    class IO_Module(models.TextChoices):
        DI = 'DI', 'DI'
        DO = 'DO', 'DO'
        IOL = 'IOL', 'IOL'
        EM = 'EM', 'EM'
    io_module = models.CharField(choices=IO_Module.choices, default=None, max_length=4)
    class Port(models.TextChoices):
        P1 = 'P1', 'P1'
        P2 = 'P2', 'P2'
        P3 = 'P3', 'P3'
        P4 = 'P4', 'P4'
        P5 = 'P5', 'P5'
        P6 = 'P6', 'P6'
        P7 = 'P7', 'P7'
        P8 = 'P8', 'P8'
        P9 = 'P9', 'P9'
        P10 = 'P10', 'P10'
        P11 = 'P11', 'P11'
        P12 = 'P12', 'P12'
        P13 = 'P13', 'P13'
        P14 = 'P14', 'P14'
        P15 = 'P15', 'P15'
        P16 = 'P16', 'P16'
    port = models.CharField(choices=Port.choices,default=None, max_length=4)
    
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
        self.ip_address = self.plc.ip_address
        super(Device, self).save(*args, **kwargs)

    class Meta:
        unique_together = ('port', 'plc', 'io_module')
