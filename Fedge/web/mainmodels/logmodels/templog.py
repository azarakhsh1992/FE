from django.db import models
from ..equipment.temperaturesensordevice import TemperatureSensor


class TempLog(models.Model):
    tempdevice = models.ForeignKey(TemperatureSensor, on_delete=models.CASCADE, related_name='templog')
