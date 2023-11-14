from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from ..mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from ..mainmodels.equipment.energymodule import EnergysensorDevice,EnergySensorValue
from ..mainmodels.equipment.doorsensor import DoorSensor,DoorsensorValue
from..mainmodels.equipment.latch import Latch,LatchValue
from..mainmodels.equipment.latchsensor import LatchSensor,LatchSensorValue
from..mainmodels.equipment.led import LED,LedValue
#TODO: viewset class for (temp ,

class PApp(viewsets.ModelViewSet):
    @action(methods=['POST'], detail=False)
    def temp(self,request):
        data = request.data
        data_profinet = data['profinet_name']
        data_moduleType = data['module_type']
        if data_moduleType == "temperature_sensor":
            try:
                tsensor = TemperatureSensor.objects.get(profinet_name=data_profinet)
                tsensor_value = TemperatureSensorValue.objects.create(temperaturesensordevice=tsensor,
                                    tempvalue=data["T"],tempvalue_min=data["Tmin"],tempvalue_max=data["Tmax"],
                                                                          humidvalue=data["RH"],time=data["Time"])
                response = {"message":"success"}
                return Response(response, status=status.HTTP_200_OK)
            except:
                response = {"message": "Temp sensor not defined"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {"message": "wrong module type"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'], detail=False)
    def energy(self, request):
        data = request.data
        data_profinet = data['profinet_name']
        data_moduleType = data['module_type']
        if data_moduleType == "Energy Measurement Module":
            try:
                esensor = EnergysensorDevice.objects.get(profinet_name=data_profinet)
                esensor_value = EnergySensorValue.objects.create(energysensordevice=esensor,
                                                                 energy_value=data["E"],energy_unit=data["UnitE"],
                                                                 power_value=data["P"],power_unit=data["UnitP"],
                                                                 time=data["time"])
                response = {"message": "success"}
                return Response(response, status=status.HTTP_200_OK)
            except:
                response = {"message": "Energy sensor not defined"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {"message": "wrong module type"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['POST'], detail=False)
    def dido(self, request):
        data = request.data
        data_profinet = data['profinet_name']
        data_moduleType = data['module_type']
        if data_moduleType == "Door Sensor":
            try:
                doorsensor = DoorSensor.objects.get(profinet_name=data["profinet_name"])
                doorsensor_value = DoorsensorValue.objects.create(doorsensordevice=doorsensor,
                                                                  value=data["value"], time=data["time"])
                response = {"message": "success"}
                return Response(response, status=status.HTTP_200_OK)
            except:
                response = {"message": "doorsensor not defined"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)

        elif data_moduleType == "Lock actuator":
            try:
                locksensor = Latch.objects.get(profinet_name=data["profinet_name"])
                locksensor_value = LatchValue.objects.create(latch=locksensor,
                                                             value=data["value"], time=data["time"])
                response = {"message": "success"}
                return Response(response, status=status.HTTP_200_OK)
            except:
                response = {"message": "locksensor not defined"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)

        elif data_moduleType == "Latch Sensor":
            try:
                latchsensor = LatchSensor.objects.get(profinet_name=data["profinet_name"])
                latchsensor_value = LatchSensorValue.objects.create(latchsensor=latchsensor,
                                                                  value=data["value"], time=data["time"])
                response = {"message": "success"}
                return Response(response, status=status.HTTP_200_OK)
            except:
                response = {"message": "latchsensor not defined"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)

        elif data_moduleType == "LED":
            try:
                ledsensor = LED.objects.get(profinet_name=data["profinet_name"])
                ledsensor_value = LedValue.objects.create(led=ledsensor,
                                                                  value=data["value"], time=data["time"])
                response = {"message": "success"}
                return Response(response, status=status.HTTP_200_OK)
            except:
                response = {"message": "ledsensor not defined"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {"message": "wrong module type"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)