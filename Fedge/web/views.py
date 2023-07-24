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
    
    this_user = User.objects.get(token__token = this_token)
    this_door = Door.objects.get(qr= this_qr)
    # this_door_cabinet = str(Door.objects.filter(qr= this_qr).values_list('cabinet').first())[1:-2]
    this_cabinet = str(Cabinet.objects.filter(id=str(Door.objects.filter(qr= this_qr).values_list('cabinet').first())[1:-2]).values_list('profinet_name').first())[2:-3]
    
    # this_users = User.objects.get(email =this_user)
    # this_doors = Door.objects.get(name = this_door)
    # # I think I should work with their ID or PK instead of editing everything
    
    # print(this_users)
    # print(this_doors)

    print(this_user)
    print(this_door)
    print(this_cabinet)
    print(type(this_door))
    
    access_checker(this_user, this_door)

    return  JsonResponse({
        'status': 'ok'

    }, encoder=json.JSONEncoder)

