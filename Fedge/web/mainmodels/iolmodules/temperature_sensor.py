from django.db import models
from ..modules.iolink import Io_link
from ..cabinetlevel.doors import Door
from ..iolmodules.iolmodule import Iol_Module


class Temperature_sensor (Iol_Module):
    class Measuring_env (models.TextChoices):
        IN = 'IN', 'inside'
        OUT = 'OUT', 'outside'
    measuring_env = models.CharField(choices= Measuring_env.choices, default ="IN", max_length=8)
    module_type = "temperature and humidity sensor module"
    value_temperature = models.FloatField(default=0)
    value_humidity = models.FloatField(default=0)
        
    class Meta:
        pass