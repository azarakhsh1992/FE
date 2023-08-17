from django.db import models
from ..iolmodules.doorsensor import DoorsensorDevice


class DoorsensorLog(models.Model):
    doorsensordevice = models.ForeignKey(DoorsensorDevice, on_delete=models.CASCADE, related_name='doorsensorlog')
