from django.db import models
from ..iolmodules.led import LedDevice


class LedLog(models.Model):
    leddevice = models.ForeignKey(LedDevice, on_delete=models.CASCADE, related_name='ledlog')
