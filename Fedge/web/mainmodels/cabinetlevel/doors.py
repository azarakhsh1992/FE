import uuid
from typing import Any
from django.db import models
from ..cabinetlevel.cabinets import Cabinet, Rack
from django.core.exceptions import ValidationError
from ..timescale import TimescaleModel



class Door(models.Model):

    class Direction(models.TextChoices):
        Front = 'Front', 'Front'
        Rear = 'Rear', 'Rear'
        NETWORK = 'Network', 'Network rack'
        ENERGY = 'Energy', 'Energy rack'
    direction = models.CharField(choices=Direction.choices,max_length=32, null=False)
    rack = models.ForeignKey(Rack, related_name='doors', on_delete=models.CASCADE, null=False)
    qr = models.CharField(max_length=32, unique=True, blank=True, editable=True, null=False,help_text="The QR Code will automatically generated for the first time")
    def __str__(self):
        return ('Cabinet: '+self.rack.cabinet.profinet_name+' Rack: '+self.rack.name + ' ,'+ self.direction)
    def clean(self):
        if self.rack.name =="Network" and self.direction != "Network":
            raise ValidationError("Wrong selection: The door must be 'Network rack' since you have chosen the Network for the rack.")
        if self.rack.name =="Energy" and self.direction != "Energy":
            raise ValidationError("Wrong selection: The door must be 'Energy rack' since you have chosen the Energy for the rack.")
        elif self.rack.name in ["Edge_A","Edge_B","Cooling"] and self.direction in ["Network", "Energy"]:
            raise ValidationError("Wrong selection: Select either Front or Rear as direction for this rack")
        else:
            pass
    def save(self, *args, **kwargs):
        self.cabinet=self.rack.cabinet
        if not self.pk:
            doors = Door.objects.all()
            condition = True
            generatedqr = uuid.uuid4().hex[:20]
            if doors:
                for door in doors:
                    while condition:
                        if generatedqr == door.qr:
                            generatedqr = uuid.uuid4().hex[:20]
                            condition = True
                        else:
                            condition = False
            self.qr = generatedqr
        
        super(Door, self).save(*args, **kwargs)
        
    class Meta:
        unique_together = ('direction', 'rack')
        

class DoorStatus (TimescaleModel):
    class Status(models.TextChoices):
        Locked = "Locked", "Locked"
        Faulted = "Faulted", "Faulted"
        Unlocked = "Unlocked", "Unlocked"
        Open = "Open", "Open"
        No_Data = "No Data", "No Data"
    class StatusDoorSensor(models.TextChoices):
        Close = "close", "close"
        Open = "open", "open"
        No_Data = "No Data", "No Data"
    class StatusLatchSensor(models.TextChoices):
        Close = "close", "close"
        Open = "open", "open"
        No_Data = "No Data", "No Data"
    door=models.ForeignKey(Door,on_delete=models.CASCADE, related_name='doorstatus')
    status= models.CharField(choices=Status.choices, max_length=32, null=False,default=Status.No_Data,editable=False)
    status_door_sensor = models.CharField(choices=StatusDoorSensor.choices,max_length=16, default=StatusDoorSensor.No_Data)
    status_latch_sensor = models.CharField(choices=StatusLatchSensor.choices,max_length=16, default=StatusLatchSensor.No_Data)
    def save(self, *args, **kwargs):
        if self.status_latch_sensor == self.StatusLatchSensor.Open:
            if self.status_door_sensor == self.StatusDoorSensor.Open:
                self.status=self.Status.Open
            elif self.status_door_sensor == self.StatusDoorSensor.Close:
                self.status=self.Status.Unlocked
        elif self.status_latch_sensor == self.StatusLatchSensor.Close:
            if self.status_door_sensor == self.StatusDoorSensor.Close:
                self.status = self.Status.Locked
            elif self.status_door_sensor == self.StatusDoorSensor.Open:
                self.status = self.Status.Faulted
        else:
            self.status = self.Status.No_Data
        super(DoorStatus, self).save(*args, **kwargs)