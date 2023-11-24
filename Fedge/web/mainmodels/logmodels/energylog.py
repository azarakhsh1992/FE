from django.db import models
from ..equipment.energymodule import EnergySensor


class EnergyLog(models.Model):
    energydevice = models.ForeignKey(EnergySensor, on_delete=models.CASCADE, related_name='energylog')
