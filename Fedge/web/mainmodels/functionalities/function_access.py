from django.db import models
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..cabinetlevel.doors import Door
from ..userrelated.groupofshifts import Shifts
from ..userrelated.users import User, UserProfile
from datetime import datetime, date, time, timezone



def shift_checker():
# time in integer = hour*60 + minute
    current_shift = False
    shift_time1_start = 360 # 06:00 Früh schift definer
    shift_time1_end = 900   # 15:00

    shift_time2_start = 870  # 15:00 Spät shift definer
    shift_time2_end = 1350  # 22:30 

    shift_time3_start = 1320  # 22:00Nacht shift definer
    shift_time3_mid = 1440  # 00:00 O´Clock
    shift_time3_end = 390  # 06:30 O´Clock

    current_time = ((datetime.now().hour) * 60) + datetime.now().minute
    if int(shift_time1_start) <= int(current_time) <= int(shift_time1_end):
        current_shift = "Early"
    elif int(shift_time2_start) <= int(current_time) <= int(shift_time2_end):
        current_shift = "Late"
    elif int(shift_time3_start) <= int(current_time) <= int(shift_time3_mid) or\
        int(shift_time3_mid) <= int(current_time) <= int(shift_time3_end):
        current_shift = "NACHT"
    else:
        current_shift = False
    return current_shift

def user_door_checker(thisuser, door):
    #TODO: here must the accessible doors be clearly defined
    profile = UserProfile.objects.get(user=thisuser)
    this_door = Door.objects.get(pk=door.pk)
    rack_name = this_door.rack.name
    if profile.role== "Elektriker":
        if rack_name == "Energy":
            door_access = True
            door_response = " you have access to the Energy rack door"
        elif rack_name == "Cooling" and this_door.direction == "Rear":
            door_access = True
            door_response = " you have access to the Cooling rack door"
        else:
            door_access = False
            door_response = "The scanned door is: %s, on this rack: %s, and you do not have access to this door." %this_door.direction %rack_name
    elif profile.role == "Anlagen":
        door_access = False
        door_response="The employee accessible doors not defined."
    elif profile.role == "IT":
        door_access = False
        door_response="The employee accessible doors not defined."
    elif profile.role == "Netzwerk":
        door_access = False
        door_response="The employee accessible doors not defined."
    elif profile.role == "IH":
        door_access = False
        door_response="The employee accessible doors not defined."
    else:
        door_access = False
        door_response="The employee role is not defined."
    return door_access,door_response


def access_checker(user, door):
    response = '-'
    access = False
    this_door= Door.objects.get(pk=door.pk)
    this_user = User.objects.get(username=user)
    profile = UserProfile.objects.get(user=this_user)
    usergroup = profile.employee_group
    shifofuser = Shifts.objects.get(group=usergroup, date=datetime.now().date())
    current_user_shift = shifofuser.shift
    current_shift = shift_checker();
    current_day = datetime.now().weekday()
    
    door_access, door_response = user_door_checker(thisuser=this_user, door=this_door)
    response_bereich = "-"
    response_shift = "-"
    shift_access = False
    bereich_access = False
    
    if profile.bereich == this_door.rack.cabinet.bereich:
        bereich_access = True
        response_bereich="You have access on this area (Bereich)./ "
    else:
        response_bereich = "You do not have access on this area (Bereich)./ "
        
    if current_user_shift== current_shift:
        shift_access=True
        response_shift="you are currently in your shift./ "
    elif current_shift == False:
        shift_access=False
        response_shift="This shift is not defined"
        
    else:
        shift_access = False
        response_shift ="you are not currently in your shift./ "
        
    
    if shift_access and bereich_access and door_access:
        access = True
    else:
        access = False

    if current_day== 5 or current_day == 6:
        shift_access = False
        response_shift = "Today is not a working day./ "
    response = response_shift+response_bereich+door_response
    return access, response

    #TODO: A function of logging the event should be added to the end of this function