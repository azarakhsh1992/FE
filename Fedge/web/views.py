from django.shortcuts import render
from django.http import HttpResponse
from .mainmodels.doors import Door
from .mainmodels.users import User
from .mainmodels.cabinets import Cabinet
from .mainmodels.functions import Access_Checker
from .mainmodels.function_access import access_checker

import random

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

def test_models(request):
    print("we are here")
#    print(Temperature_sensor.objects.get.all())