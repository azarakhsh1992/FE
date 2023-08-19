from django.db import models
from django.contrib.auth.models import User
from ..cabinetlevel.cabinets import Cabinet
from ..cabinetlevel.doors import Door


class Request(models.Model):
    user = models.ForeignKey(User, related_name='requests')
    cabinet = models.ForeignKey(Cabinet, related_name='requests')
    door = models.ForeignKey(Door, related_name='requests')
    description = models.CharField(max_length=255, blank=False, null=False)
    datetime = models.DateTimeField()


class Servicelog(models.Model):
    request = models.OneToOneField(Request, related_name='servicelog', on_delete=models.CASCADE)
    description = models.TextField(blank=False)
    datetime = models.DateTimeField()

class Permission(models.Model):
    request = models.OneToOneField(Request, related_name='permission', on_delete=models.CASCADE)
    accessable = models.BooleanField(default=False)
    datetime = models.DateTimeField()
    rejectionlog = models.CharField(max_length=255, blank=True, null=True)