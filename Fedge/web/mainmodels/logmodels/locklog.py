from django.db import models
from ..equipment.latch import Latch


class LockLog(models.Model):
    lockdevice = models.ForeignKey(Latch, on_delete=models.CASCADE, related_name='locklog')
