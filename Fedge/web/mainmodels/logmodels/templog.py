from django.db import models
from ..iolmodules.temperaturesensordevice import TemperaturesensorDevice


class TempLog(models.Model):
    tempdevice = models.ForeignKey(TemperaturesensorDevice, on_delete=models.CASCADE, related_name='templog')
