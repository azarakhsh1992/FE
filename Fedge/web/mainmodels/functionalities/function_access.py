from django.db import models
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..cabinetlevel.doors import Door
from ..userrelated.groupofshifts import Shifts, EmployeeGroup, ShiftAssignment
from ..userrelated.users import User, UserProfile
from datetime import datetime, timedelta


def user_door_checker(user, qrcode):
    #TODO: here must the accessible doors be clearly defined
    profile = UserProfile.objects.get(user=user)
    this_door = Door.objects.get(qr=qrcode)
    rack_name = this_door.rack.name
    cabinet = this_door.rack.cabinet.profinet_name
    if profile.role== "Elektriker":
        if rack_name == "Energy":
            door_access = True
            door_response = " You have access to the Energy rack door of the {cabinet}"
        elif rack_name == "Cooling" and this_door.direction == "Rear":
            door_access = True
            door_response = f" You have access to the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet"
        else:
            door_access = False
            door_response = f"The scanned door is the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet, and you do not have access to this door."
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


def shift_checker():
    # time in integer = hour*60 + minute
    early_shift=False
    late_shift=False
    night_shift=False
    normal_shift=False
    
    early_shift_extra_passed=True
    late_shift_extra_passed=True
    night_shift_extra_passed=True
    normal_shift_extra_passed=True
    
    shift_time1_start = Shifts.objects.get(shift="Early").shift_start_int
    shift_time1_end = Shifts.objects.get(shift="Early").shift_end_int
    shift_time1_extra = Shifts.objects.get(shift="Early").extra_time_int

    shift_time2_start = Shifts.objects.get(shift="Late").shift_start_int
    shift_time2_end = Shifts.objects.get(shift="Late").shift_end_int 
    shift_time2_extra = Shifts.objects.get(shift="Late").extra_time_int 

    shift_time3_start = Shifts.objects.get(shift="Night").shift_start_int
    shift_time3_mid = 1440  # 00:00 O´Clock
    shift_time3_end = Shifts.objects.get(shift="Night").shift_end_int
    shift_time3_extra = Shifts.objects.get(shift="Night").extra_time_int

    shift_time4_start = Shifts.objects.get(shift="Normal").shift_start_int
    shift_time4_end = Shifts.objects.get(shift="Normal").shift_end_int
    shift_time4_extra = Shifts.objects.get(shift="Normal").extra_time_int
    
    current_time = ((datetime.now().hour) * 60) + datetime.now().minute
    if shift_time1_start < current_time < shift_time1_end:
        early_shift = True
    else:
        if shift_time1_start-shift_time1_extra < current_time < shift_time1_end+shift_time1_extra:
            early_shift_extra_passed = False
        else:
            early_shift_extra_passed = True
    if shift_time2_start < current_time < shift_time2_end:
        late_shift = True
    else:
        if shift_time2_start-shift_time2_extra < current_time < shift_time2_end+shift_time2_extra:
            late_shift_extra_passed = False
        else:
            late_shift_extra_passed = True
    if (shift_time3_start < current_time < shift_time3_mid) or (shift_time3_mid < current_time < shift_time3_end):
        night_shift = True
    else:
        if shift_time3_start-shift_time3_extra < current_time < shift_time3_mid or\
            shift_time3_mid < current_time < shift_time3_extra+ shift_time3_end:
            night_shift_extra_passed= False
        else:
            night_shift_extra_passed=True
    if shift_time4_start < current_time < shift_time4_end:
        normal_shift = True
    else:
        if shift_time4_start - shift_time4_extra < current_time < shift_time4_end + shift_time4_extra:
            normal_shift_extra_passed= False
        else:
            normal_shift_extra_passed=True
    return early_shift,late_shift,night_shift,normal_shift, early_shift_extra_passed, late_shift_extra_passed,night_shift_extra_passed,normal_shift_extra_passed



def access_shift(user):
    access=False
    current_day = datetime.now().weekday()
    group = UserProfile.objects.get(user=user).employee_group.id
    now = datetime.now().date()
    current_user_shift = ShiftAssignment.objects.filter(group=group,\
        starting_date__lte=now, ending_date__gte=now).first().shift.shift
    early_shift, late_shift, night_shift, normal_shift, early_passed, late_passed, night_passed, normal_passed = shift_checker()

    if current_day== 5 or current_day == 6:
        access = False
        response = "Today is not a working day. "
    
    elif current_user_shift =="Early":
        if early_shift:
            access = True
            response = "You are on your shift. "
        else:
            if not early_passed:
                access = True
                response = "You are on your extra time for today's shift. "
            else:
                access = False
                response = "You are not on your shift. "
    
    elif current_user_shift =="Late":
        if late_shift:
            access = True
            response = "You are on your shift. "
        else:
            if not late_passed:
                access = True
                response = "You are on your extra time for today's shift. "
            else:
                access = False
                response = "You are not on your shift. "
    
    elif current_user_shift =="Night":
        if night_shift:
            access = True
            response = "You are on your shift. "
        else:
            if not night_passed:
                access = True
                response = "You are on your extra time for today's shift. "
            else:
                access = False
                response = "You are not on your shift. "
    
    elif current_user_shift =="Normal":
        if normal_shift:
            access = True
            response = "You are on your shift. "
        else:
            if not normal_passed:
                access = True
                response = "You are on your extra time for today's shift. "
            else:
                access = False
                response = "You are not on your shift. "
    else:
        access=False
        response= "You're shift is not defined in the database. "
    return access,response


def access_checker(user, qrcode):
    response = '-'
    access = False
    this_door= Door.objects.get(qr=qrcode)
    this_user = User.objects.get(id=user)
    profile = UserProfile.objects.get(user=this_user)
    door_access, door_response = user_door_checker(user=this_user, qrcode=qrcode)
    response_bereich = "-"
    shift_access, response_shift = access_shift(user=this_user)
    bereich_access = False
    
    if profile.bereich.capitalize() == this_door.rack.cabinet.bereich.capitalize():
        bereich_access = True
        response_bereich=f"You have access on this area (Bereich: {this_door.rack.cabinet.bereich}). "
    else:
        response_bereich = f"You do not have access on this area (Bereich: {this_door.rack.cabinet.bereich}). "
    if shift_access and bereich_access and door_access:
        access = True
    else:
        access = False
        #TODO: a log that gets the data of cabinet, rack, door, user, response, datetime that saves into another model
    response = response_shift+response_bereich+door_response
    return access, response

    #TODO: A function of logging the event should be added to the end of this function