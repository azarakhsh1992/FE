from typing import Any
from django.db import models
from django.core.exceptions import ValidationError


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
    bereich = models.CharField(choices= Bereich.choices, max_length=1, help_text="it must have at least one character")
    segment = models.CharField(max_length=1, help_text="it must have at least one character")
    anlage = models.CharField(max_length=4, help_text="it must have at least four character")
    arg_sps = models.CharField(max_length=1, help_text="it must have at least one character")
    pultbereich_sk = models.CharField(max_length=1, help_text="it must have at least one character")
    station = models.CharField(max_length=4, help_text="it must have at least four character")
    profinet_name = models.CharField(max_length=12, editable=False, unique=True)
    class Meta:
        unique_together = ('bereich','segment', 'anlage', 'arg_sps', 'pultbereich_sk','station')
    def save(self, *args, **kwargs):
        self.profinet_name = self.bereich + self.segment + self.anlage + self.arg_sps + self.pultbereich_sk + self.station
        if len(self.profinet_name) != 12:
            raise ValidationError("Please check your inputs, the Profinet name must be 12 characters long")
        super(Cabinet, self).save(*args, **kwargs)
    def __str__(self):
        return ("Cabinet: "+self.profinet_name + " Bereich: " + self.bereich)



class Rack(models.Model):
    class Name(models.TextChoices):
        Edge_A = "Edge_A", "Edge_A"
        Edge_B = "Edge_B", "Edge_B"
        Network = "Network", "Network"
        Energy = "Energy", "Energy"
        Cooling = "Cooling", "Cooling"
    name = models.CharField(choices=Name.choices, default=None, max_length=16, null=False)
    cabinet = models.ForeignKey(Cabinet, on_delete=models.CASCADE, related_name='racks')
    class Meta:
        unique_together = ('name', 'cabinet')
    def save(self, *args, **kwargs):
        super(Rack, self).save(*args, **kwargs)
    def __str__(self):
        return ("Cabinet: "+self.cabinet.profinet_name+ "Rack: "+self.name)
