from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door



class Device(models.Model):
    plc = models.ForeignKey(PLC, related_name='plcdevices', on_delete=models.CASCADE)
    #TODO: profinet name of the PLC must be checked; if Gerät and BMK is for Device, it should be editted as PLC to be Funktionseinheit
    #TODO: module inheritance works, Form class must be created for each module to implement uniqueness conditions
    bmk = models.CharField(max_length=3, default=None)
    geraet = models.CharField(max_length=3, default=None)
    serial_number = models.CharField(max_length=50, unique=True)
    manufacturer = models.CharField(max_length=50)
    profinet_name = models.CharField(max_length=22, editable=False, unique=True)
    
    class IO_Module(models.TextChoices):
        DI = 'DI', 'DI'
        DO = 'DO', 'DO'
        IOL = 'IOL', 'IOL'
        EM = 'EM', 'EM'
    io_module = models.CharField(choices=IO_Module.choices, default=None, max_length=4)
    class Port(models.TextChoices):
        P0 = 'P0', 'P0'
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
        self.profinet_name = self.plc.profinet_name + self.geraet + self.bmk
        super(Device, self).save(*args, **kwargs)
    class Meta:
        unique_together = ('port', 'io_module','plc')
    def __str__(self):
        return self.profinet_name
