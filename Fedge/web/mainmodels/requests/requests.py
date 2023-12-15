from django.db import models
from django.contrib.auth.models import User
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..cabinetlevel.doors import Door


class Request(models.Model):
    user = models.ForeignKey(User, related_name='requests', on_delete=models.CASCADE)
    cabinet = models.ForeignKey(Cabinet, related_name='requests', on_delete=models.CASCADE, editable=False)
    door = models.ForeignKey(Door, related_name='requests', on_delete=models.CASCADE)
    rack = models.ForeignKey(Rack, related_name='requests', on_delete=models.CASCADE)
    status = models.CharField(max_length=128,blank=True, null=True)
    description = models.TextField(max_length=512, blank=True, null=True)
    servicelog = models.BooleanField(default=False)
    access = models.BooleanField(default=False)
    button_pushed = models.BooleanField(default=False, blank=False, null=False)
    cancelled_by_frontend = models.BooleanField(default=False, blank=False, null=False)
    sent_to_plc = models.BooleanField(default=False, blank=False, null=False)
    sent_to_frontend = models.BooleanField(default=False, blank=False, null=False)
    time = models.DateTimeField()
    def save(self, *args, **kwargs):
        self.cabinet = self.door.rack.cabinet
        super(Request, self).save(*args, **kwargs)
class Servicelog(models.Model):
    request = models.OneToOneField(Request, related_name='servicelogs', on_delete=models.CASCADE)
    description = models.TextField(blank=False)
    time = models.DateTimeField()
