from django.db import models
from .cabinets import Cabinet
from .iolink import Io_link
from .doors import Door
from .Ports import Ports
    
    
    
class Lock_actuator (Ports):
    class Module_type (models.TextChoices):
        LOCK = 'LOCK', 'Lock actuator'
    module_type = models.CharField (choices= Module_type.choices, max_length=20)
    bmk = models.CharField(max_length =4, default=None)
    serial_number = models.CharField(max_length=50, unique=True)
    manufacturer = models.CharField(max_length = 50)
    profinet_address = models.GenericIPAddressField(default=None, unique=False, editable=False)
    profinet_name = models.CharField(max_length=22, editable=False, default=None)
    # module_type = models.CharField(max_length=22, editable=False, default=None)
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
    geraet = models.CharField(max_length=3, editable=False)
    
    door = models.ForeignKey(Door, on_delete= models.CASCADE)
    iolink = models.ForeignKey(Io_link, on_delete= models.CASCADE)
    
    port = Ports.port

    def save(self, *args, **kwargs):
        self.bereich = self.iolink.bereich
        self.segment = self.iolink.segment
        self.anlage = self.iolink.anlage
        self.arg_sps = self.iolink.arg_sps
        self.pultbereich_sk = self.iolink.pultbereich_sk
        self.station = self.iolink.station
        self.funktionseinheit = self.iolink.funktionseinheit
        self.geraet = self.iolink.geraet
        self.profinet_name = str(self.iolink.profinet_name) + str(self.geraet)
        self.profinet_address = str(self.iolink.profinet_address)
        super(Lock_actuator, self).save(*args, **kwargs)