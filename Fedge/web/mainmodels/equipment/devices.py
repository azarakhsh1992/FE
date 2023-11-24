from django.db import models
from .plc import PLC
from ..cabinetlevel.doors import Door
from ..cabinetlevel.cabinets import Rack
from django.core.exceptions import ValidationError

    # class Port_16(models.TextChoices):
    #     P1 = 'P1', 'P1'
    #     P2 = 'P2', 'P2'
    #     P3 = 'P3', 'P3'
    #     P4 = 'P4', 'P4'
    #     P5 = 'P5', 'P5'
    #     P6 = 'P6', 'P6'
    #     P7 = 'P7', 'P7'
    #     P8 = 'P8', 'P8'
    #     P9 = 'P9', 'P9'
    #     P10 = 'P10', 'P10'
    #     P11 = 'P11', 'P11'
    #     P12 = 'P12', 'P12'
    #     P13 = 'P13', 'P13'
    #     P14 = 'P14', 'P14'
    #     P15 = 'P15', 'P15'
    #     P16 = 'P16', 'P16'
    # class Port_8(models.TextChoices):
    #     P1 = 'P1', 'P1'
    #     P2 = 'P2', 'P2'
    #     P3 = 'P3', 'P3'
    #     P4 = 'P4', 'P4'
    #     P5 = 'P5', 'P5'
    #     P6 = 'P6', 'P6'
    #     P7 = 'P7', 'P7'
    #     P8 = 'P8', 'P8'
    # class Port_2(models.TextChoices):
    #     P1 = 'P1', 'P1'
    #     P2 = 'P2', 'P2'
    # class Port_4(models.TextChoices):
    #     P1 = 'P1', 'P1'
    #     P2 = 'P2', 'P2'
    #     P3 = 'P3', 'P3'
    #     P4 = 'P4', 'P4'
    # class IO_Module(models.TextChoices):
    #     DI_1 = 'DI_16', 'DI 16-Kanal'
    #     DI_2 = 'DI_2', 'DI 2-Kanal'
    #     DO_1 = 'DO_16', 'DO 16-Kanal'
    #     DO_2 = 'DO_8', 'DO 8-Kanal'
    #     IOL_1 = 'IOL_1', 'IOL 1'
    #     IOL_2 = 'IOL_2', 'IOL 2'
    #     EM_1 = 'EM_1', 'EM 1'
    #     EM_2 = 'EM_2', 'EM 2'


class Device(models.Model):
    plc = models.ForeignKey(PLC, related_name='devices', on_delete=models.DO_NOTHING, null=False)
    #TODO: profinet name of the PLC must be checked; if Gerät and BMK is for Device, it should be editted as PLC to be Funktionseinheit
    #TODO: module inheritance works, Form class must be created for each module to implement uniqueness conditions
    rack= models.ForeignKey(Rack, editable=True, related_name="device", null=False, on_delete=models.DO_NOTHING)
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
