from rest_framework import viewsets, status
from rest_framework.decorators import action
from django.contrib.auth.models import User
from .mainmodels.users import UserProfile
from .mainmodels.serializers import UserProfileSerializer, UserSerializer, ButtonSerializer, CabinetSerializer
from .mainmodels.serializers import DoorSensorSerializer
from .mainmodels.button import Button
from .mainmodels.cabinets import Cabinet
from .mainmodels.door_sensor import Door_sensor
from .mainmodels.doors import Door
from .mainmodels.iolink import Io_link
from .mainmodels.temperature_sensor import Temperature_sensor
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly
from django.http import HttpResponse
from django.http import JsonResponse
from .mainmodels.door_status import Check_door, is_safe
from .mainmodels.function_access import access_checker
<<<<<<< HEAD
from .mainmodels.cabinets import Cabinet
from .mainmodels.button import Button
from .mainmodels.json import Json_draft
import time
from datetime import datetime, date, time, timezone
=======
>>>>>>> 0d1a122e7d8ac3af406b740f51d8a5e33f1a6662
from django.views.decorators.csrf import csrf_exempt
import random
import json
import requests
from django.db.models import CharField
from django.db.models.functions import Lower


<<<<<<< HEAD
#TODO: az hameye modela serializer dorost koni ba attributayi ke niaz hast, va classe viewset dorost koni

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
def access_check(request):
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



@csrf_exempt #baraye exempt kardane csrf protection for security reasons
def door_status(request):
    print (request.POST)

    if request.method == 'POST':
        this_qr = request.POST.get('qr', None)
    this_door = Door.objects.get(qr= this_qr)
    this_cabinet = Cabinet.objects.get(door =this_door)
    print(this_cabinet)
    print(this_door)
    print(type(this_door))
    
    status = Check_door(this_cabinet)

    return  JsonResponse({
        'status': status

    }, encoder=json.JSONEncoder)


@csrf_exempt #baraye exempt kardane csrf protection for security reasons
def unlocking(request):
    print (request.POST)

    if request.method == 'POST':
        this_token = request.POST.get('token', None)
        this_qr = request.POST.get('qr', None)
    
    this_user = User.objects.get(token__token = this_token)
    this_door = Door.objects.get(qr= this_qr)
    this_cabinet = Cabinet.objects.get(door =this_door)
    this_iolink =Io_link.objects.get(cabinet = this_cabinet)
    this_button = Button.objects.get(iolink =this_iolink)
    if is_safe(this_cabinet):
        if Check_door(this_cabinet):
            if this_button.value:
                return  JsonResponse({
                    'status': 'door will now be open'
                }, encoder=json.JSONEncoder)
            else:
                #TODO: here some background program should work that django wont stop, and that program should manage the delay for waiting time
                if this_button.value == False:
                    return  JsonResponse({
                        'status': 'you did not push the button, access request expired'
                    }, encoder=json.JSONEncoder)
                else:
                    return  JsonResponse({
                        'status': 'access granted'
                    }, encoder=json.JSONEncoder)
                return JsonResponse({
                    'status': 'please push the door button again'
                })

        else:
            return  JsonResponse({
                'status': 'this door must be closed because some one is already working there'
            }, encoder=json.JSONEncoder)
    else:
        return  JsonResponse({
            'status': 'this door must be closed due to safety issues'
        }, encoder=json.JSONEncoder)
        
response1=Json_draft.objects.get(id=1).send_json()
print(response1)
=======
# CharField.register_lookup(Lower)
#
# # from apscheduler.schedulers.background import BlockingScheduler, BackgroundScheduler
#
#
# random.seed()
#
# def update(request):
#     access_checker(1,1,1,1)
#     # def function():
#     #     name = "temp1"
#     #     value = float(random.randint(0, 50))
#     #     Temperature_sensor.objects.filter(name=name).update(value=value)
#     # scheduler = BackgroundScheduler()
#     # scheduler.add_job(function, 'interval', seconds =2)
#     # scheduler.start()
#     return HttpResponse("value has changed")
#
# def home(request):
#     return HttpResponse('<h1>Web Home</h1>')
#
# @csrf_exempt #baraye exempt kardane csrf protection for security reasons
# def access_check(request):
#     print (request.POST)
#     # this_user = User.objects.filter(token__token = this_token)
#     # print(this_user)
#     if request.method == 'POST':
#         this_token = request.POST.get('token', None)
#         this_qr = request.POST.get('qr', None)
#
#     this_user = User.objects.get(token__token = this_token)
#     this_door = Door.objects.get(qr= this_qr)
#     # this_door_cabinet = str(Door.objects.filter(qr= this_qr).values_list('cabinet').first())[1:-2]
#     this_cabinet = str(Cabinet.objects.filter(id=str(Door.objects.filter(qr= this_qr).values_list('cabinet').first())[1:-2]).values_list('profinet_name').first())[2:-3]
#
#     # this_users = User.objects.get(email =this_user)
#     # this_doors = Door.objects.get(name = this_door)
#     # # I think I should work with their ID or PK instead of editing everything
#
#     # print(this_users)
#     # print(this_doors)
#
#     print(this_user)
#     print(this_door)
#     print(this_cabinet)
#     print(type(this_door))
#
#     access_checker(this_user, this_door)
#
#     return  JsonResponse({
#         'status': 'ok'
#
#     }, encoder=json.JSONEncoder)
#
#
#
# @csrf_exempt #baraye exempt kardane csrf protection for security reasons
# def door_status(request):
#     print (request.POST)
#
#     if request.method == 'POST':
#         this_qr = request.POST.get('qr', None)
#     this_door = Door.objects.get(qr= this_qr)
#     this_cabinet = Cabinet.objects.get(door =this_door)
#     print(this_cabinet)
#     print(this_door)
#     print(type(this_door))
#
#     status = Check_door(this_cabinet)
#
#     return  JsonResponse({
#         'status': status
#
#     }, encoder=json.JSONEncoder)
#
#
# @csrf_exempt #baraye exempt kardane csrf protection for security reasons
# def unlocking(request):
#     print (request.POST)
#
#     if request.method == 'POST':
#         this_token = request.POST.get('token', None)
#         this_qr = request.POST.get('qr', None)
#
#     this_user = User.objects.get(token__token = this_token)
#     this_door = Door.objects.get(qr= this_qr)
#     this_cabinet = Cabinet.objects.get(door =this_door)
#     this_iolink =Io_link.objects.get(cabinet = this_cabinet)
#     this_button = Button.objects.get(iolink =this_iolink)
#     if is_safe(this_cabinet):
#         if Check_door(this_cabinet):
#             if this_button.value:
#                 return  JsonResponse({
#                     'status': 'door will now be open'
#                 }, encoder=json.JSONEncoder)
#             else:
#                 #TO DO: here some background program should work that django wont stop, and that program should manage the delay for waiting time
#                 if this_button.value == False:
#                     return  JsonResponse({
#                         'status': 'you did not push the button, access request expired'
#                     }, encoder=json.JSONEncoder)
#                 else:
#                     return  JsonResponse({
#                         'status': 'access granted'
#                     }, encoder=json.JSONEncoder)
#                 return JsonResponse({
#                     'status': 'please push the door button again'
#                 })
#
#         else:
#             return  JsonResponse({
#                 'status': 'this door must be closed because some one is already working there'
#             }, encoder=json.JSONEncoder)
#     else:
#         return  JsonResponse({
#             'status': 'this door must be closed due to safety issues'
#         }, encoder=json.JSONEncoder)

# ////////////////////////////////////////////////////////////////////////////////////////////////
class UserProfileViewset(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer

class UserViewset(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    # authentication_classes = [TokenAuthentication]
    # permission_classes = [AllowAny]

class ButtonViewset(viewsets.ModelViewSet):
    queryset = Button.objects.all()
    serializer_class = ButtonSerializer

class CabinetViewset(viewsets.ModelViewSet):
    queryset = Cabinet.objects.all()
    serializer_class = CabinetSerializer

    authentication_classes = [TokenAuthentication]
    permission_classes = [AllowAny]
    @action(methods=['POST'], detail=True)
    def checkTemp(self, request, qr):
        door = Door.objects.get(qr=qr)
        cabinet = Cabinet.objects.get(door=door)
        iolink = Io_link.objects.get(cabinet=cabinet)
        value = Temperature_sensor.objects.get(iolink=iolink).value_temperature
        return Response({'temp': value}, status.HTTP_200_OK)
    @action(methods=['POST'], detail=True)
    def checkEnergy:
    @action(methods=['POST'], detail=True)
    def checkDoorSensor:
    @action(methods=['POST'], detail=True)
    def checkActuator:
    @action(methods=['POST'], detail=True)
    def checkLed:
    @action(methods=['POST'], detail=True)
    def checkButton:
    @action(methods=['POST'], detail=True)
    def checkLock:


class DoorSensorViewset(viewsets.ModelViewSet):
    queryset = Door_sensor.objects.all()
    serializer_class = DoorSensorSerializer
>>>>>>> 0d1a122e7d8ac3af406b740f51d8a5e33f1a6662
