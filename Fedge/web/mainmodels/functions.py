from django.db import models
from .cabinets import Cabinet
from .iolink import Io_link
from .doors import Door
from .lock import Lock_actuator
from .led import Led
from .temperature_sensor import Temperature_sensor
from .users import User
from datetime import datetime, date, time, timezone
from rest_framework import viewsets, status



class Access_Checker(viewsets.ModelViewSet):

    user = models.ForeignKey(User, on_delete=models.CASCADE, default= None)
    cabinet = models.ForeignKey(Cabinet, on_delete=models.CASCADE, default=None)
    door = models.ForeignKey(Door, on_delete=models.CASCADE, default=None)
    comment = models.TextField (max_length=500)
    accses_granted = models.BooleanField (default=False)
    
    shift_time1_start = models.IntegerField (default=480) # time in integer = hour*60 + minute
    shift_time1_end = models.IntegerField (default=870) # Früh schift definer
    
    shift_time2_start = models.IntegerField (default= 871) # Spät shift definer
    shift_time2_end = models.IntegerField (default= 1000)
    
    shift_time3_start = models.IntegerField (default=1001) # Nacht shift definer
    shift_time3_end = models.IntegerField (default=1400)
    
    def access_checker(self, *args, **kwargs):
        current_time = ((datetime.now().hour)*60) + datetime.now().minute
        current_shift = 0
        if int(self.shift_time1_start) <= int(current_time) <= int(self.shift_time1_end):
            current_shift = "Früh"
        elif int(self.shift_time2_start) <= int(current_time) <= int(self.shift_time2_end):
            current_shift = "Spät"
        elif int(self.shift_time3_start) <= int(current_time) <= int(self .shift_time3_end):
            current_shift = "Nacht"
        else:
            return ("current time is not defined as any of the shifts")
            
        if current_shift != self.user.shift:
            print("access denied because worng shift time")
            return False
        elif self.user.bereich != self.door.cabinet.bereich:
            print ("access denied because wrong location")
            return False
        elif self.cabinet.funktionseinheit not in self.user.accessable_cabinets:
            return False
        
        else:
            print("access granted")
            return True