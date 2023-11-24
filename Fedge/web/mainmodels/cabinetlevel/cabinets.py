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
    bereich = models.CharField(choices= Bereich.choices, max_length=1, help_text="it must have one character")
    segment = models.CharField(max_length=1, help_text="it must have one character",)
    anlage = models.CharField(max_length=4, help_text="it must have four character")
    arg_sps = models.CharField(max_length=1, help_text="it must have one character")
    pultbereich_sk = models.CharField(max_length=1, help_text="it must have one character")
    station = models.CharField(max_length=4, help_text="it must have four character")
    profinet_name = models.CharField(max_length=12, editable=False, unique=True)
    class Meta:
        unique_together = ('bereich','segment', 'anlage', 'arg_sps', 'pultbereich_sk','station')
    def save(self, *args, **kwargs):
        self.bereich=self.bereich.upper()
        self.segment=self.segment.upper()
        self.anlage=self.anlage.upper()
        self.arg_sps=self.arg_sps.upper()
        self.pultbereich_sk=self.pultbereich_sk.upper()
        self.station=self.station.upper()
        self.profinet_name = self.bereich + self.segment + self.anlage + self.arg_sps + self.pultbereich_sk + self.station
        if len(self.profinet_name) != 12:
            raise ValidationError("Please check your inputs, the Profinet name must be 12 characters long")
        super(Cabinet, self).save(*args, **kwargs)
    def __str__(self):
        return ("Cabinet: "+self.profinet_name + " Bereich: " + self.bereich)
    def clean(self):

        if self.segment != None and len(self.segment) != 1:
            raise ValidationError("Error: BMK must have exactly 4 characters")
        elif self.anlage!=None and len(self.anlage) != 4:
            raise ValidationError("Error: Anlage must have exactly 3 characters")
        elif self.arg_sps != None and len(self.arg_sps) != 1:
            raise ValidationError("Error: Arg_Sps must have exactly 3 characters")
        elif self.pultbereich_sk != None and len(self.pultbereich_sk) != 1:
            raise ValidationError("Error: Pultbereich_SK must have exactly 3 characters")
        elif self.station != None and len(self.station) != 4:
            raise ValidationError("Error: Station must have exactly 3 characters")


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
        return ("Cabinet: "+self.cabinet.profinet_name+ ", Rack: "+self.name)
