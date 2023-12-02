from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Rack
from django.core.exceptions import ValidationError
from timescale.db.models.fields import TimescaleDateTimeField
from timescale.db.models.managers import TimescaleManager
from django.utils.timezone import now

class Device(models.Model):
    plc = models.ForeignKey(PLC, related_name='devices', on_delete=models.CASCADE, null=False)
    #TODO: profinet name of the PLC must be checked; if Gerät and BMK is for Device, it should be editted as PLC to be Funktionseinheit
    #TODO: module inheritance works, Form class must be created for each module to implement uniqueness conditions
    rack= models.ForeignKey(Rack, editable=True, related_name="device", null=False, on_delete=models.CASCADE)
    geraet = models.CharField(max_length=3, default=None)
    bmk = models.CharField(max_length=4, default=None)
    serial_number = models.CharField(max_length=50, unique=True)
    manufacturer = models.CharField(max_length=50)
    profinet_name = models.CharField(max_length=22, editable=False, unique=True)
    module_type = models.CharField(max_length=32, default="not defined", editable=False)
    io_module = models.CharField(default=None, max_length=8, editable=False)
    port = models.CharField(null=True, editable=False, max_length=4)
    class Meta:
        unique_together = ('port', 'io_module','plc')


    def save(self, *args, **kwargs):
        self.geraet=self.geraet.upper()
        self.bmk=self.bmk.upper()
        self.profinet_name = self.plc.cabinet.bereich+self.plc.cabinet.segment+self.plc.cabinet.anlage+self.plc.cabinet.arg_sps+self.plc.cabinet.pultbereich_sk+self.plc.cabinet.station+self.plc.funktionseinheit+self.geraet+self.bmk
        super(Device, self).save(*args, **kwargs)
    def __str__(self):
        return self.profinet_name




class TimescaleModel(models.Model):
    
    """
    A helper class for using Timescale within Django, has the TimescaleManager and
    TimescaleDateTimeField already present. This is an abstract class it should
    be inheritted by another class for use.
    """

    time = TimescaleDateTimeField(interval="7 day")
    objects = models.Manager()
    timescale = TimescaleManager()

    class Meta:
        abstract = True




#TODO: implement this method when creating all sorts of devices in order to get the response of clean function for form
# def your_view(request):
#     if request.method == 'POST':
#         form = YourModelForm(request.POST)
#         if form.is_valid():
#             # Save form data
#             pass
#         else:
#             # Handle form errors
#             pass
#     else:
#         form = YourModelForm()
#     return render(request, 'your_template.html', {'form': form})
