from django.db import models
from ..cabinetlevel.cabinets import Cabinet
from ..modules.iolink import Iolink
from ..cabinetlevel.doors import Door
from ..iolmodules.temperaturesensordevice import TemperaturesensorDevice
from ..userrelated.groupofshifts import ShiftOfGroup
from ..userrelated.users import User, UserProfile
from datetime import datetime, date, time, timezone


def shift_checker():
    current_shift = False
    shift_time1_start = 100  # time in integer = hour*60 + minute
    shift_time1_end = 870  # Früh schift definer

    shift_time2_start = 871  # Spät shift definer
    shift_time2_end = 1000

    shift_time3_start = 1001  # Nacht shift definer
    shift_time3_end = 1600

    current_time = ((datetime.now().hour) * 60) + datetime.now().minute
    if int(shift_time1_start) <= int(current_time) <= int(shift_time1_end):
        current_shift = "FRUEH"
    elif int(shift_time2_start) <= int(current_time) <= int(shift_time2_end):
        current_shift = "SPAET"
    elif int(shift_time3_start) <= int(current_time) <= int(shift_time3_end):
        current_shift = "NACHT"
    else:
        current_shift = False
    return current_shift
def access_checker(user, door):

    this_user = user
    this_door = door

    response = ''
    access = False


    profile = UserProfile.objects.get(user=this_user)
    usergroup = profile.group
    shifofuser = ShiftOfGroup.objects.get(group=usergroup, date=datetime.now().date())
    shiftnow = shifofuser.shift
    current_shift = shift_checker();
    if shiftnow == current_shift:
        if this_user.bereich == this_door.cabinet.bereich:
            if this_door.section == this_user.accessible_cabinets:
                response = "access granted"
                access = True
                return access, response
            else:
                response = "Access Denide, you are in shift but no access to this section"
                access = False
                return access, response
        else:
            response = "Access Denide, you are in shift but no access to this Bereich"
            access = False
            return access, response
    else:
        response = "Access Denide, you are not in shift"
        access = False
        return access, response

    #TODO: check the last elif. it shoudl be changed. Also a function of logging the event should be added to the end of this function


