from django.db import models


class EmployeeGroup(models.Model):
    class Group(models.TextChoices):
        GROUP1 = "group1", "Group 1"
        GROUP2 = "group2", "Group 2"
        GROUP3 = "group3", "Group 3"
        GROUPE4 = "group4", "Group 4"
    group = models.CharField(max_length=10, choices=Group.choices, default=None)


class Shifts(models.Model):
    group = models.ForeignKey(to=EmployeeGroup, related_name='employeegroup', on_delete=models.CASCADE)

    class Shift(models.TextChoices):
        EARLY = "Early", "Early:Früh"
        LATE = "Late", "Late:Spät"
        NIGHT = "Night", "Night:Nacht"
        NORMAL = "Normal", "Normal"

    shift = models.CharField(max_length=10, choices=Shift.choices, default=None)
    date = models.DateField()