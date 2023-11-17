from django.db import models
from django.contrib.auth.models import User
from .groupofshifts import EmployeeGroup
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..cabinetlevel.doors import Door


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
    employee_group = models.ForeignKey(EmployeeGroup, related_name='employee_group', on_delete=models.CASCADE)
