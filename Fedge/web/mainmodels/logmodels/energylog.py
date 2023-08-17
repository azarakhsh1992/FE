from django.db import models
from ..modules.energymodule import EnergysensorDevice


class EnergyLog(models.Model):
    energydevice = models.ForeignKey(EnergysensorDevice, on_delete=models.CASCADE, related_name='energylog')
