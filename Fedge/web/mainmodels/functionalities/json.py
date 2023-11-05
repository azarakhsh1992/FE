from django.db import models



class Json_draft(models.Model):
    name = models.CharField(max_length=128)
    code =models.CharField(max_length=64,default='request')
    cid = models.IntegerField(default=4711)
    adr =models.CharField(max_length=128,default='/plcmaster/port[2]/plcdevice/pdin/getdata')
    url = models.URLField(max_length=32, default="http://192.168.0.4")
    data = models.TextField(max_length=256, blank=True)
    sensor = models.CharField(max_length=256,blank=False)
    command = models.CharField(max_length=256,blank=False)