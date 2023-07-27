from typing import Any
from django.db import models
class Cabinet(models.Model):
    
    class Bereich (models.TextChoices):
        K = 'K', 'Karosseriebau'
        F = 'F', 'Fördertechnik'
        M = 'M', 'Montage'
        I = 'I', 'Inhouse Logistik'
        P = 'P', 'Presswerk'
        L = 'L', 'Lackiererei'
        B = 'B', 'Batteriefertigung'
        C = 'C', 'Komponente'
    bereich = models.CharField(choices= Bereich.choices, default =None, max_length=1)
    segment = models.CharField(max_length=1, help_text="it must have at least one character")
    anlage = models.CharField(max_length=4, help_text="it must have at least four character")
    arg_sps = models.CharField(max_length=1)
    pultbereich_sk = models.CharField(max_length=1)
    station = models.CharField(max_length=4)
    funktionseinheit = models.CharField(max_length=3)
    def save(self, *args, **kwargs):
        self.profinet_name = str(self.bereich) + str(self.segment) + str(self.anlage) + str(self.arg_sps)\
        + str(self.pultbereich_sk) + str(self.station) + str(self.funktionseinheit)
        super(Cabinet, self).save(*args, **kwargs)
    profinet_name = models.CharField (max_length=15, editable=False, default=None, unique=True)
    class Meta:
        pass   