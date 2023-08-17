from django.db import models
from ..iolmodules.lock import LockactuatorDevice


class LockLog(models.Model):
    lockdevice = models.ForeignKey(LockactuatorDevice, on_delete=models.CASCADE, related_name='locklog')
