from django.db import models
from ..equipment.temperaturesensordevice import TemperaturesensorDevice


class HumidLog(models.Model):
    humiddevice = models.ForeignKey(TemperaturesensorDevice, on_delete=models.CASCADE, related_name='humidlog')
