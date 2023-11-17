from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from ..mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from ..mainmodels.equipment.energymodule import EnergysensorDevice,EnergySensorValue
from ..mainmodels.equipment.doorsensor import DoorSensor,DoorsensorValue
from..mainmodels.equipment.latch import Latch,LatchValue
from..mainmodels.equipment.latchsensor import LatchSensor,LatchSensorValue
from..mainmodels.equipment.led import LED,LedValue
from..mainmodels.equipment.button import DoorButton,ButtonValue
from..mainmodels.equipment.devices import Device
from django.views.decorators.csrf import csrf_exempt



class MqttMiddleware(viewsets.ModelViewSet):
    queryset = Device.objects.all()
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def temp(self,request):
        data = request.data
        try:
            data_profinet = data['profinet_name']
            # response_data={data["T"],data["Tmin"],data["Tmax"],data["RH"],data["F"],data["Time"]}
            tsensor = TemperatureSensor.objects.get(profinet_name=data_profinet)
            try:
                if data["F"] == "False":
                    TemperatureSensorValue.objects.create(temperaturesensordevice=tsensor,\
                        tempvalue=data["T"],tempvalue_min=data["Tmin"],tempvalue_max=data["Tmax"],humidvalue=data["RH"],time=data["Time"])
                    response = {"message":"success"}
                elif data["F"] == "True":
                    TemperatureSensorValue.objects.create(temperaturesensordevice=tsensor,fault=True,time=data["Time"])
                    response = {"message":"success"}
                else:
                    response = {"message": "'F' as Fault not defined, data not recoreded"}
                return Response(response, status=status.HTTP_200_OK)
            except:
                response = {"message": "Data does not match"}
                # response = {{"message": "Data does not match"},response_data}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        except:
            response = {"message": "Profinet_name for temperature sensor does not exist"}
            # response = {data_profinet:response_data}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
################################################################
################################################################
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def energy(self, request):
        data = request.data
        try:
            data_profinet = data['profinet_name']
            try:
                emsensor = EnergysensorDevice.objects.get(profinet_name=data_profinet)
                if data ["F"]== "False":
                    EnergySensorValue.objects.create(energysensordevice=emsensor,energy_value=data["E"],energy_unit=data["UnitE"],\
                        power_value=data["P"],power_unit=data["UnitP"],time=data["time"])
                    response = {"message": "success"}
                elif data ["F"] == "True":
                    EnergySensorValue.objects.create(energysensordevice=emsensor,fault=True,time=data["time"])
                    response = {"message": "success, Fault:True"}
                else:
                    response = {"message": "'F' as Fault not defined, data not recoreded"}
                return Response(response, status=status.HTTP_200_OK)
            except:
                response = {"message": "Data does not match"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        except:
            response = {"message": "Profinet_name for Energy Sensor does not exist"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
################################################################
################################################################
    @csrf_exempt 
    @action(methods=['POST'],detail=False)
    def dido(self, request):
        data = request.data
        try:
            device_moduletype= Device.objects.get(profinet_name=data["profinet_name"]).this_module_type
    ################################################################
            if device_moduletype == "Door Sensor":
                try:
                    doorsensor = DoorSensor.objects.get(profinet_name=data["profinet_name"])
                    if data ["F"] == "False":
                        DoorsensorValue.objects.create(doorsensordevice=doorsensor,value=data["value"])
                        response = {"message": "success"}
                    elif data ["F"] == "True":
                        DoorsensorValue.objects.create(doorsensordevice=doorsensor,fault=True)
                        response = {"message": "success: Fault:True"}
                    else:
                        response = {"message": "'F' as Fault not defined, data not recoreded"}
                    return Response(response, status=status.HTTP_200_OK)
                except:
                    response = {"message": "Data does not match"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
    ################################################################
            elif device_moduletype == "Latch":
                
                try:
                    this_latch = Latch.objects.get(profinet_name=data["profinet_name"])
                    if data["F"] == "False":
                        response="here"
                        LatchValue.objects.create(latch=this_latch, value=data["value"])
                        response = {"message": "success"}
                    elif data["F"] == "True":
                        LatchValue.objects.create(latch=this_latch,fault=True)
                        response = {"message": "success, Fault:True"}
                    else:
                        response = {"message": "'F' as Fault not defined, data not recoreded"}
                    return Response(response, status=status.HTTP_200_OK)
                except:
                    # response = {"message": "Data does not match"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
    ########################################################################
            elif device_moduletype == "Latch Sensor":
                try:
                    latchsensor = LatchSensor.objects.get(profinet_name=data["profinet_name"])
                    if data ["F"] == "False":
                        LatchSensorValue.objects.create(latchsensor=latchsensor,value=data["value"])
                        response = {"message": "success"}
                    elif data["F"] == "True":
                        LatchSensorValue.objects.create(latchsensor=latchsensor,fault=True)
                        response = {"message": "success, Fault:True"}
                    else:
                        response = {"message": "'F' as Fault not defined, data not recoreded"}
                    return Response(response, status=status.HTTP_200_OK)
                except:
                    response = {"message": "Data does not match"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
    #########################################################################
            elif device_moduletype == "LED":
                try:
                    this_led = LED.objects.get(profinet_name=data["profinet_name"])
                    if data ["F"] == "False":
                        LedValue.objects.create(led=this_led,value=data["value"])
                        response = {"message": "success"}
                    elif data ["F"] == "True":
                        LedValue.objects.create(led=this_led,fault =True)
                        response = {"message": "success, Fault:True"}
                    else:
                        response = {"message": "'F' as Fault not defined, data not recoreded"}
                    return Response(response, status=status.HTTP_200_OK)
                except:
                    response = {"message": "Data does not match"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
    ##########################################################################
            elif device_moduletype == "Door Button":
                try:
                    doorbtn = DoorButton.objects.get(profinet_name=data["profinet_name"])
                    if data ["F"] == "False":
                        ButtonValue.objects.create(doorbutton=doorbtn,value=data["value"])
                        response = {"message": "success"}
                    elif data ["F"] == "True":
                        ButtonValue.objects.create(doorbutton=doorbtn, fault=True)
                        response = {"message": "success, Fault:True"}
                    else:
                        response = {"message": "'F' as Fault not defined, data not recoreded"}
                    return Response(response, status=status.HTTP_200_OK)
                except:
                    response = {"message": "Data does not match"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
    ####################################################################
            else:
                response = {"message": "module not found in the database"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        except:
            response = {"message": "This Profinet_name does not exist"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)