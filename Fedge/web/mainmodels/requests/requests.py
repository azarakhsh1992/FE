from django.db import models
from django.contrib.auth.models import User
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..cabinetlevel.doors import Door


class Request(models.Model):
    user = models.ForeignKey(User, related_name='requests', on_delete=models.CASCADE)
    cabinet = models.ForeignKey(Cabinet, related_name='requests', on_delete=models.CASCADE, editable=False)
    door = models.ForeignKey(Door, related_name='requests', on_delete=models.CASCADE)
    rack = models.ForeignKey(Rack, related_name='requests', on_delete=models.CASCADE)
    description = models.CharField(max_length=255, blank=False, null=False)
    servicelog = models.BooleanField(default=False)
    buttonstatus = models.BooleanField(default=False, blank=False, null=False)
    cancelinghdw = models.BooleanField(default=False, blank=False, null=False)
    cancelingfrnt = models.BooleanField(default=False, blank=False, null=False)
    sendtomiddleware = models.BooleanField(default=False, blank=False, null=False)
    sendtofrontend = models.BooleanField(default=False, blank=False, null=False)
    datetime = models.DateTimeField()
    def save(self, *args, **kwargs):
        self.cabinet = self.door.rack.cabinet
        super(Request, self).save(*args, **kwargs)
class Servicelog(models.Model):
    request = models.OneToOneField(Request, related_name='servicelogs', on_delete=models.CASCADE)
    description = models.TextField(blank=False)
    datetime = models.DateTimeField()
