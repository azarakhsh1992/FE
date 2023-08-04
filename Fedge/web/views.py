from django.contrib.auth.models import User
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly
from rest_framework.decorators import action
from rest_framework import viewsets, status
from .mainmodels.users import UserProfile
from .mainmodels.serializers import UserProfileSerializer, UserSerializer, ButtonSerializer, CabinetSerializer
from .mainmodels.serializers import DoorSensorSerializer
from .mainmodels.door_sensor import Door_sensor
from .mainmodels.doors import Door
from .mainmodels.iolink import Io_link
from .mainmodels.temperature_sensor import Temperature_sensor
from .mainmodels.serializers import Jsonserializer
from .mainmodels.json import Json_draft
from .mainmodels.cabinets import Cabinet
from .mainmodels.cabinets import Cabinet
from .mainmodels.json import Json_draft
from .mainmodels.button import Button
from django.http import HttpResponse
from django.http import JsonResponse
from .mainmodels.door_status import Check_door, is_safe
from .mainmodels.function_access import access_checker
from .mainmodels.button import Button
import time
from datetime import datetime, date, time, timezone
from django.views.decorators.csrf import csrf_exempt
import random
import json
import requests
from .mainmodels.serializers import CommandSerializer
from django.db.models import CharField
from django.db.models.functions import Lower
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
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

#     if request.method == 'POST':
#         this_qr = request.POST.get('qr', None)
#     this_door = Door.objects.get(qr= this_qr)
#     this_cabinet = Cabinet.objects.get(door =this_door)
#     print(this_cabinet)
#     print(this_door)
#     print(type(this_door))

#     status = Check_door(this_cabinet)

#     return  JsonResponse({
#         'status': status

#     }, encoder=json.JSONEncoder)


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

# print (Json_draft.objects.get(id=1))
# Json_draft.objects.get(id=1).send_json
# print(Json_draft.objects.get(id=1).send_json)
# Json_draft.objects.get(id=2)
# print(Json_draft.objects.get(id=2).send_json)

# Json_draft.objects.get(id=3).send_json
# Json_draft.objects.get(id=4).send_json

# ////////////////////////////////////////////////////////////////////////////////////////////////
class UserProfileViewset(viewsets.ModelViewSet):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer


class UserViewset(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    # authentication_classes = [TokenAuthentication]
    # permission_classes = [AllowAny]


class JasonViewset(viewsets.ModelViewSet):
    queryset = Json_draft.objects.all()
    serializer_class = Jsonserializer
    permission_classes = (AllowAny,)

    @action(methods=['PUT'], detail=True, serializer_class=CommandSerializer)
    def send_json(self, request, pk):
        # serializer = CommandSerializer(data=request)
        print(request)

@csrf_exempt
def CommandViewset(request):
    data = json.loads(request.body)
    mydata = Json_draft.objects.get(sensor=data.get('sensor'), command=data.get('command'))
    respon = {
        'data': mydata.name
    }
    return JsonResponse(respon)

    # json_request = Json_draft.objects.get(pk=pk)
    # data = Json_draft.objects.get(pk=pk).data
    # url = Jsonserializer(url=request.url)
    # serialized_data = Jsonserializer(cid=request.cid, code=request.code, adr=request.adr)
    # print("ok")
    # if data =='':
    #     pass
    # else:
    #     x = {'data': data}
    #     serialized_data = json.loads(serialized_data).update(x)
    #
    # headers = {}
    # headers['Content-Type'] = 'application/json'
    #
    # # try:
    # #     response = requests.request(method, url, data=json.dumps(serialized_data), headers=headers)
    # #     response.raise_for_status()  # Raise an exception for HTTP errors (4xx, 5xx)
    # #     return response.json()
    # # except requests.exceptions.RequestException as e:
    # #     raise e

    """
        Function to send a JSON request to the specified URL.

        Parameters:
            url (str): The URL to which the JSON request will be sent.
            data (dict): The JSON data to be included in the request body.
            method (str, optional): The HTTP method to use for the request (e.g., 'GET', 'POST', 'PUT', 'DELETE'). Default is 'POST'.
            headers (dict, optional): Additional headers to include in the request. Default is None.

        Returns:
            dict: The JSON response from the server.

        Raises:
            requests.exceptions.RequestException: If there is an error during the request.
    """


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
    def checkEnergy():
        pass

    @action(methods=['POST'], detail=True)
    def checkDoorSensor():
        pass

    @action(methods=['POST'], detail=True)
    def checkActuator():
        pass

    @action(methods=['POST'], detail=True)
    def checkLed():
        pass

    @action(methods=['POST'], detail=True)
    def checkButton():
        pass

    @action(methods=['POST'], detail=True)
    def checkLock():
        pass


class DoorSensorViewset(viewsets.ModelViewSet):
    queryset = Door_sensor.objects.all()
    serializer_class = DoorSensorSerializer
