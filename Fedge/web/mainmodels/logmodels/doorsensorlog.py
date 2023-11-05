from django.db import models
from ..equipment.doorsensor import DoorSensor


class DoorsensorLog(models.Model):
    doorsensordevice = models.ForeignKey(DoorSensor, on_delete=models.CASCADE, related_name='doorsensorlog')
