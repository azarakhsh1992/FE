from django.db import models
from ..equipment.button import DoorButton


class ButtonLog(models.Model):
    buttondevice = models.ForeignKey(DoorButton, on_delete=models.CASCADE, related_name='buttonlog')
