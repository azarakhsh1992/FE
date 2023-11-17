from typing import Any
from django.db import models
from ..cabinetlevel.cabinets import Cabinet


class PLC (models.Model):

    cabinet = models.OneToOneField(Cabinet, related_name='plc', on_delete=models.CASCADE)
    module_type = 'PLC'
    funktionseinheit = models.CharField(max_length=3, default=None, help_text="it must have at least three character")
    ip_address = models.GenericIPAddressField(default=None, unique=True)
    serial_number = models.CharField(max_length=32, unique=True)
    mac_address = models.CharField(max_length=32, default=None)
    profinet_name = models.CharField(max_length=18, editable=False, default=None, unique=True)
    def save(self, *args, **kwargs):
        self.profinet_name = self.cabinet.profinet_name + self.funktionseinheit
        super(PLC, self).save(*args, **kwargs)
    def __str__(self):
        return self.profinet_name