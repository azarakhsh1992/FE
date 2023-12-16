from django.db import models
from ..cabinetlevel.cabinets import Cabinet, Rack
from ..cabinetlevel.doors import Door
from ..userrelated.groupofshifts import Shifts, EmployeeGroup, ShiftAssignment
from ..userrelated.users import User, UserProfile
from django.utils import timezone
from .door_status import Check_door_status, is_safe

def user_role_condition(user, door):
    #TODO: here must the accessible doors be clearly defined
    profile = UserProfile.objects.get(user=user)
    this_door = Door.objects.get(pk=door.pk)
    rack_name = this_door.rack.name
    cabinet = this_door.rack.cabinet.profinet_name
    if profile.role== "Elektriker":
        if rack_name == "Energy":
            door_access = True
            door_response = f" You have access to the {rack_name} rack of the {cabinet} Cabinet"
        elif rack_name == "Cooling" and this_door.direction == "Rear":
            door_access = True
            door_response = f" You have access to the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet"
        else:
            door_access = False
            door_response = f"The scanned door is the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet, and you do not have access to this door."
    elif profile.role == "Anlagen":
        door_access = True
        door_response= f" You have access to the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet"
    elif profile.role == "IT":
        if rack_name in ["Edge_A","Edge_B"] and this_door.direction == "Front":
                door_access = True
                door_response = f" You have access to the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet"
        elif rack_name == "Network":
            door_access = True
            door_response = f" You have access to the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet"
        else:
            door_access = False
            door_response = f"The scanned door is the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet, and you do not have access to this door."
    elif profile.role == "Netzwerk":
        if rack_name in ["Edge_A","Edge_B"] and this_door.direction == "Rear":
                door_access = True
                door_response = f" You have access to the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet"
        elif rack_name == "Network":
            door_access = True
            door_response = f" You have access to the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet"
    elif profile.role == "IH":
        if this_door.direction == "Rear":
                door_access = True
                door_response = f" You have access to the {this_door.direction} door of the {rack_name} rack of the {cabinet} Cabinet"
    else:
        door_access = False
        door_response="The employee role or the accessible cabinet is not defined."
    door_response={"Message_r":door_response}
    return door_access,door_response


def current_shift_checker():
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
    
    current_time = ((timezone.now().hour) * 60) + timezone.now().minute
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
    current_day = timezone.now().weekday()
    group = UserProfile.objects.get(user=user).employee_group.pk
    now = timezone.now().date()
    current_user_shift = ShiftAssignment.objects.filter(group=group,\
        starting_date__lte=now, ending_date__gte=now).first().shift.shift
    early_shift, late_shift, night_shift, normal_shift, early_passed, late_passed, night_passed, normal_passed = current_shift_checker()

    if current_day== 5 or current_day == 6:
        access = False
        response = "Today is not a working day. "
    
    elif current_user_shift =="Early":
        if early_shift:
            access = True
            response = {"Message_s":"You are on your shift. "}
        else:
            if not early_passed:
                access = True
                response = {"Message_s":"You are on your extra time for today's shift. "}
            else:
                access = False
                response = {"Message_s":"You are not on your shift. "}
    
    elif current_user_shift =="Late":
        if late_shift:
            access = True
            response = {"Message_s":"You are on your shift. "}
        else:
            if not late_passed:
                access = True
                response = {"Message_s":"You are on your extra time for today's shift. "}
            else:
                access = False
                response = {"Message_s":"You are not on your shift. "}
    
    elif current_user_shift =="Night":
        if night_shift:
            access = True
            response = {"Message_s":"You are on your shift. "}
        else:
            if not night_passed:
                access = True
                response = {"Message_s":"You are on your extra time for today's shift. "}
            else:
                access = False
                response = {"Message_s":"You are not on your shift. "}
    
    elif current_user_shift =="Normal":
        if normal_shift:
            access = True
            response = {"Message_s":"You are on your shift. "}
        else:
            if not normal_passed:
                access = True
                response = {"Message_s":"You are on your extra time for today's shift. "}
            else:
                access = False
                response = {"Message_s":"You are not on your shift. "}
    else:
        access=False
        response= {"Error_s":"You're shift is not defined in the database."}
    return access,response


def access_checker(user, door):
    response = {}
    access = False
    this_user = user
    this_door = Door.objects.get(pk=door.pk)
    profile = UserProfile.objects.get(user=this_user)
    if this_door is not None and this_user is not None:
        door_access, role_response = user_role_condition(user=this_user, door=this_door)
        response_bereich = "-"
        shift_access, response_shift = access_shift(user=this_user)
        door_status_access, door_status_response = Check_door_status(door=this_door)
        is_safe_access, is_safe_response = is_safe(this_door=this_door)
        bereich_access = False
        
        if profile.bereich.upper() == this_door.rack.cabinet.bereich.upper():
            bereich_access = True
            response_bereich={"Message_b":f"You have access on this area (Bereich: {this_door.rack.cabinet.bereich})."}
        else:
            response_bereich = {"Message_b":f"You DO NOT have access on this area (Bereich: {this_door.rack.cabinet.bereich})."}
        # here the conditions are considered and the access is granted. If is_safe function returns access=False: here must the is_safe_access be in the conditions below.
        if shift_access and bereich_access and door_access and door_status_access and is_safe_access:
            access = True
        else:
            access = False
            #TODO: a log that gets the data of cabinet, rack, door, user, response, datetime that saves into another model
        
        response.update(door_status_response)
        response.update(role_response)
        response.update(response_bereich)
        response.update( response_shift)
        response.update(is_safe_response)
    else:
        access = False
        response = {"Error":"no door or user found"}
    return access, response

    #TODO: A function of logging the event should be added to the end of this function