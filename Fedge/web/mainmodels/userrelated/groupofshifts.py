from collections.abc import Iterable
from django.db import models
from django.core.exceptions import ValidationError




class Shifts(models.Model):
    class Shift(models.TextChoices):
        EARLY = "Early", "Early:Früh"
        LATE = "Late", "Late:Spät"
        NIGHT = "Night", "Night:Nacht"
        NORMAL = "Normal", "Normal"
    shift = models.CharField(max_length=10, choices=Shift.choices, default=None, unique=True)
    shift_start = models.TimeField()
    shift_end = models.TimeField()
    extra_time = models.TimeField()
    shift_start_int = models.IntegerField(editable=False)
    shift_end_int = models.IntegerField(editable=False)
    extra_time_int = models.IntegerField(editable=False)
    type= models.CharField(max_length=20, editable=False)

    def __str__(self):
        return self.shift
    class Meta:
        unique_together =["shift","shift_start","shift_end"]
    def save(self, *args, **kwargs):
        self.shift_start_int=self.shift_start.hour*60 + self.shift_start.minute
        self.shift_end_int=self.shift_end.hour*60 + self.shift_end.minute
        self.extra_time_int=self.extra_time.hour*60 + self.extra_time.minute
        self.type = type(self.shift_start_int)
        super().save(*args, **kwargs)

class EmployeeGroup(models.Model):
    class Group(models.TextChoices):
        GROUP_A = "Group_A", "Group A"
        GROUP_B = "Group_B", "Group B"
        GROUP_C = "Group_C", "Group C"
        GROUP_D = "Group_D", "Group D"
    group = models.CharField(max_length=10, choices=Group.choices, default=None, unique=True)
    def __str__(self):
        return self.group


class ShiftAssignment(models.Model):
    group = models.ForeignKey(EmployeeGroup,related_name="groups", on_delete=models.CASCADE)
    shift = models.ForeignKey(Shifts, related_name="shifts",on_delete=models.CASCADE)
    starting_date = models.DateField()
    ending_date = models.DateField()
    def clean(self):
        # Check for overlapping date ranges
        overlapping_assignments = ShiftAssignment.objects.filter(
            group=self.group,
            starting_date__lt=self.ending_date,
            ending_date__gt=self.starting_date
        ).exclude(id=self.id)  # Exclude the current instance if updating

        if overlapping_assignments.exists():
            raise ValidationError("Overlapping shift assignments for this group.")
    def save(self, *args, **kwargs):
        self.clean()
        super(ShiftAssignment, self).save(*args, **kwargs)
    # def __str__(self):
    #     return (self.group, self.shift, self.starting_date, self.ending_date)
    class Meta:
        unique_together =["group", "starting_date","ending_date"]