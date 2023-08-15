from django.db import models
from ..modules.iolink import Io_link
from ..iolmodules.iolmodule import Iol_Module

        
class Button (Iol_Module):
    value = models.BooleanField(default=False)

    class Meta:
        pass