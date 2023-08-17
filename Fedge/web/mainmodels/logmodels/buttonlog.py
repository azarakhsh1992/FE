from django.db import models
from ..iolmodules.button import ButtonDevice


class ButtonLog(models.Model):
    buttondevice = models.ForeignKey(ButtonDevice, on_delete=models.CASCADE, related_name='buttonlog')
