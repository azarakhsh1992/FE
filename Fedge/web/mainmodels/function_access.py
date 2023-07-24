from django.db import models
from .cabinets import Cabinet
from .iolink import Io_link
from .doors import Door
from .lock import Lock_actuator
from .led import Led
from .temperature_sensor import Temperature_sensor
from .users import User
from datetime import datetime, date, time, timezone



def access_checker(user, door):

    this_user = user
    this_door = door
    current_shift = 0

    shift_time1_start =100 # time in integer = hour*60 + minute
    shift_time1_end =870 # Früh schift definer

    shift_time2_start = 871 # Spät shift definer
    shift_time2_end = 1000

    shift_time3_start =1001 # Nacht shift definer
    shift_time3_end =1600

    current_time = ((datetime.now().hour)*60) + datetime.now().minute
    if int(shift_time1_start) <= int(current_time) <= int(shift_time1_end):
        current_shift = "FRUEH"
    elif int(shift_time2_start) <= int(current_time) <= int(shift_time2_end):
        current_shift = "SPAET"
    elif int(shift_time3_start) <= int(current_time) <= int(shift_time3_end):
        current_shift = "NACHT"
    else:
        print ("current time is not defined as any of the shifts")
    print(current_time)
    print(current_shift)
    if this_user.bereich != this_door.cabinet.bereich:
        print ("access denied because wrong location")
        return False
    elif current_shift != this_user.shift:
        print("access denied because worng shift time")
        return False
    # elif this_door.cabinet.funktionseinheit not in this_user.accessable_cabinets:
    #     return False
    #TODO: check the last elif. it shoudl be changed
    
    else:
        print("access granted")
        return True

