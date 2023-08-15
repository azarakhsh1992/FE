from django.db import models


class GroupShift(models.Model):
    class Group(models.TextChoices):
        GROUP1 = "group1", "Group 1"
        GROUP2 = "group2", "Group 2"
        GROUP3 = "group3", "Group 3"

    group = models.CharField(max_length=10, choices=Group.choices, default=None)


class ShiftOfGroup(models.Model):
    group = models.ForeignKey(to=GroupShift, related_name='groupshift', on_delete=models.CASCADE)

    class Shift(models.TextChoices):
        FRUEH = "FRUEH", "Frueh"
        SPAET = "SPAET", "Spaet"
        NACHT = "NACHT", "Nacht"

    shift = models.CharField(max_length=10, choices=Shift.choices, default=None)
    date = models.DateField()