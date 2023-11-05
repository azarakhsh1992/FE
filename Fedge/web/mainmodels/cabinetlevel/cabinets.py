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
    bereich = models.CharField(choices= Bereich.choices, default =None, max_length=1, help_text="it must have at least one character")
    segment = models.CharField(max_length=1, help_text="it must have at least one character")
    anlage = models.CharField(max_length=4, help_text="it must have at least four character")
    arg_sps = models.CharField(max_length=1, help_text="it must have at least one character")
    pultbereich_sk = models.CharField(max_length=1, help_text="it must have at least one character")
    station = models.CharField(max_length=4, help_text="it must have at least four character")
    profinet_name = models.CharField(max_length=15, editable=False, default=None, unique=True)
    def save(self, *args, **kwargs):
        self.profinet_name = str(self.bereich) + str(self.segment) + str(self.anlage) + str(self.arg_sps) + str(self.pultbereich_sk) + str(self.station)
        super(Cabinet, self).save(*args, **kwargs)
    class Meta:
        pass
    def __str__(self):
        return self.profinet_name
class Rack(models.Model):
    class Name(models.TextChoices):
        Edge_A = "Edge_A", "Edge_A"
        Edge_B = "Edge_B", "Edge_B"
        Network = "Network", "Network"
        Energy = "Energy", "Energy"
        Cooling = "Cooling", "Cooling"
    name = models.CharField(choices=Name.choices, default=None, max_length=16, null=False)
    cabinet = models.ForeignKey(Cabinet, on_delete=models.CASCADE, null=False)
    def __str__(self):
        return self.name
    class Meta:
        unique_together = ('name', 'cabinet')
