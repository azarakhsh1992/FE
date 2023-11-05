from django.db import models
from ..equipment.led import LED


class LedLog(models.Model):
    led = models.ForeignKey(LED, on_delete=models.CASCADE, related_name='ledlog')
