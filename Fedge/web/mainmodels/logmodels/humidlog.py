from django.db import models
from ..equipment.temperaturesensordevice import TemperatureSensor


class HumidLog(models.Model):
    humiddevice = models.ForeignKey(TemperatureSensor, on_delete=models.CASCADE, related_name='humidlog')
