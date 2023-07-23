from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.shortcuts import render
from .mainmodels.doors import Door
from .mainmodels.users import User
from .mainmodels.cabinets import Cabinet
from .mainmodels.functions import Access_Checker
from .mainmodels.function_access import access_checker
from datetime import datetime, date, time, timezone
from django.views.decorators.csrf import csrf_exempt
import random
import json
from django.db.models import CharField
from django.db.models.functions import Lower

CharField.register_lookup(Lower)

# from apscheduler.schedulers.background import BlockingScheduler, BackgroundScheduler


random.seed()

def update(request):
    access_checker(1,1,1,1)
    # def function():
    #     name = "temp1"
    #     value = float(random.randint(0, 50))
    #     Temperature_sensor.objects.filter(name=name).update(value=value)
    # scheduler = BackgroundScheduler()
    # scheduler.add_job(function, 'interval', seconds =2)
    # scheduler.start()
    return HttpResponse("value has changed")

def home(request):
    return HttpResponse('<h1>Web Home</h1>')

@csrf_exempt #baraye exempt kardane csrf protection for security reasons
def test(request):
    print (request.POST)
    # this_user = User.objects.filter(token__token = this_token)
    # print(this_user)
    if request.method == 'POST':
        this_token = request.POST.get('token', None)
        this_qr = request.POST.get('qr', None)
    this_user = User.objects.filter(token__token = this_token)
    this_door = Door.objects.filter(qr= this_qr)
    # this_cabinet = Cabinet.objects.filter(door__id = this_door)
    print(this_user)
    print(this_door)
    # print(this_cabinet)    
    return  JsonResponse({
        'status': 'ok'

    }, encoder=json.JSONEncoder)

# #    print(Temperature_sensor.objects.get.all())
#     user = User.objects.get(pk=User.pk)
#     door = Door.objects.get(pk = Door.pk)
#     current_shift = 0

#     shift_time1_start =480 # time in integer = hour*60 + minute
#     shift_time1_end =870 # Früh schift definer

#     shift_time2_start = 871 # Spät shift definer
#     shift_time2_end = 100

#     shift_time3_start =1001 # Nacht shift definer
#     shift_time3_end =1400

#     current_time = ((datetime.now().hour)*60) + datetime.now().minute
#     if int(shift_time1_start) <= int(current_time) <= int(shift_time1_end):
#         current_shift = "Früh"
#     elif int(shift_time2_start) <= int(current_time) <= int(shift_time2_end):
#         current_shift = "Spät"
#     elif int(shift_time3_start) <= int(current_time) <= int(shift_time3_end):
#         current_shift = "Nacht"
#     else:
#         return ("current time is not defined as any of the shifts")

#     if current_shift != user.shift:
#         print("access denied because worng shift time")
#         return False
#     elif user.bereich != door.cabinet.bereich:
#         print ("access denied because wrong location")
#         return False
#     elif cabinet.funktionseinheit not in user.accessable_cabinets:
#         return False
    
#     else:
#         print("access granted")
#         return True
    
#     print(comment)