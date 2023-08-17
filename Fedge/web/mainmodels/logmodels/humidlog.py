from django.db import models
from ..iolmodules.temperaturesensordevice import TemperaturesensorDevice


class HumidLog(models.Model):
    humiddevice = models.ForeignKey(TemperaturesensorDevice, on_delete=models.CASCADE, related_name='humidlog')
