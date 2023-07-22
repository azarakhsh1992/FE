from typing import Any
from django.db import models


class Ports(models.Model):

    class Port_addresses (models.TextChoices):
        X1 = 'X1', 'X1'
        X2 = 'X2', 'X2'
        X3 = 'X3', 'X3'
        X4 = 'X4', 'X4'
        X5 = 'X5', 'X5'
        X6 = 'X6', 'X6'
        X7 = 'X7', 'X7'
        X8 = 'X8', 'X8'
    port = models.CharField(choices= Port_addresses.choices, default =None, max_length=5, unique=True)
