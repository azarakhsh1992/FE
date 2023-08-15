from django.db import models
from django.contrib.auth.models import User
from .groupofshifts import GroupShift


class UserProfile(models.Model):  # on_delete = CASCADE
    user = models.OneToOneField(User, related_name='profile', on_delete=models.CASCADE)
    accessable_cabinets = models.CharField(max_length=500, null=True)
    firstname = models.CharField(max_length=250,blank=True,null=True)
    lastname= models.CharField(max_length=250,blank=True,null=True)

    class Role(models.TextChoices):
        TECHNICIAN = "TECHNICIAN", "Technician"
        PLANT_OPERATOR = "PLANT_OPERATOR", "Plant Operator"
        IT_SHOPFLOOR = "IT_SHOPFLOOR", "IT Shopfloor"

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

    telephone = models.CharField(max_length=15)

    # class Shift(models.TextChoices):
    #     GROUP1 = "group1", "Group 1"
    #     GROUP2 = "group2", "Group 2"
    #     GROUP3 = "group3", "Group 3"
    #
    # shift = models.CharField(max_length=10, choices=Shift.choices, default=None)
    #
    group = models.ForeignKey(to=GroupShift, related_name='usergroup', on_delete=models.CASCADE, blank=True, null=True)
    #
    # def save (self, *args, **kwargs):
    #     if self.role == "TECHNICIAN":
    #         self.accessable_cabinets = ["'server', 'PS'"]
    #     super(User, self).save(*args, **kwargs)
    # class Meta:
    #     pass