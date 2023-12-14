from django.db import models
from django.contrib.auth.models import User
from .groupofshifts import EmployeeGroup,Shifts
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..cabinetlevel.doors import Door
from ..requests.requests import Request,Servicelog

class UserProfile(models.Model):
    user = models.OneToOneField(User, related_name='profile', on_delete=models.CASCADE)
    firstname = models.CharField(max_length=250, blank=True, null=True)
    lastname = models.CharField(max_length=250, blank=True, null=True)

    class Role(models.TextChoices):
        ELEKTR = "Elektriker", "Elektriker"
        ANLAGEN  = "Anlagen", "Anlagenfuehrer"
        IT = "IT", "IT Shopfloor"
        NETZWERK = "Netzwerk", "Netzwerktechniker"
        IH = "IH", "Instandhalter"

    role = models.CharField(choices=Role.choices, default=None, max_length=100)

    class Bereich(models.TextChoices):
        K = 'K', 'Karosseriebau'
        F = 'F', 'Foerdertechnik'
        M = 'M', 'Montage'
        I = 'I', 'Inhouse Logistik'
        P = 'P', 'Presswerk'
        L = 'L', 'Lackiererei'
        B = 'B', 'Batteriefertigung'
        C = 'C', 'Komponente'

    bereich = models.CharField(choices=Bereich.choices, default=None, max_length=1)
    telephone = models.CharField(max_length=15, blank=True, null=True)
    employee_group = models.ForeignKey(EmployeeGroup, related_name="employees",on_delete=models.SET_NULL, null=True)


class UserLog(models.Model):
    user = models.ForeignKey(to=User, on_delete=models.DO_NOTHING, related_name="userlog")
    request = models.ForeignKey(to=Request, on_delete=models.DO_NOTHING, related_name="userlog")
    servicelog = models.ForeignKey(to=Servicelog, on_delete=models.DO_NOTHING, related_name="userlog", null=True)