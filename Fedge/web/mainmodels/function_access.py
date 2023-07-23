from django.db import models
from .cabinets import Cabinet
from .iolink import Io_link
from .doors import Door
from .lock import Lock_actuator
from .led import Led
from .temperature_sensor import Temperature_sensor
from .users import User
from datetime import datetime, date, time, timezone



def access_checker(user, cabinet, door, comment):

    user = User.objects.get(pk=User.pk)
    cabinet = Cabinet.objects.get(pk=Cabinet.pk)
    door = Door.objects.get(pk = Door.pk)
    current_shift = 0

    shift_time1_start =480 # time in integer = hour*60 + minute
    shift_time1_end =870 # Früh schift definer

    shift_time2_start = 871 # Spät shift definer
    shift_time2_end = 1000

    shift_time3_start =1001 # Nacht shift definer
    shift_time3_end =1400

    current_time = ((datetime.now().hour)*60) + datetime.now().minute
    if int(shift_time1_start) <= int(current_time) <= int(shift_time1_end):
        current_shift = "Früh"
    elif int(shift_time2_start) <= int(current_time) <= int(shift_time2_end):
        current_shift = "Spät"
    elif int(shift_time3_start) <= int(current_time) <= int(shift_time3_end):
        current_shift = "Nacht"
    else:
        return ("current time is not defined as any of the shifts")

    if current_shift != user.shift:
        print("access denied because worng shift time")
        return False
    elif user.bereich != door.cabinet.bereich:
        print ("access denied because wrong location")
        return False
    elif cabinet.funktionseinheit not in user.accessable_cabinets:
        return False
    
    else:
        print("access granted")
        return True
    
    print(comment)
    
