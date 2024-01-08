from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from ..mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from ..mainmodels.equipment.energymodule import EnergySensor,EnergySensorValue
from ..mainmodels.equipment.doorsensor import DoorSensor,DoorsensorValue
from..mainmodels.equipment.latch import Latch,LatchValue
from..mainmodels.equipment.latchsensor import LatchSensor,LatchSensorValue
from..mainmodels.equipment.led import LED,LedValue, LedValueCases
from..mainmodels.equipment.button import DoorButton,ButtonValue
from ..mainmodels.equipment.coolingAlarm import ACM, ACMValue
from..mainmodels.equipment.devices import Device
from django.views.decorators.csrf import csrf_exempt
from ..mainmodels.requests.requests import Request
from ..mainmodels.cabinetlevel.doors import Door
from ..mainmodels.cabinetlevel.cabinets import Cabinet,Rack
from ..mainmodels.functionalities.mqtt_publish import send_mqtt_led
from ..mainmodels.functionalities.door_status import led_status_find
from django.utils import timezone

class MqttMiddleware(viewsets.ModelViewSet):
    queryset = Device.objects.all()
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def temp(self,request):
        data = request.data
        if "profinet_name" and "T"and "Tmin" and "Tmax" and "RH" and "validity" and "Time" in data:
            try:
                data_profinet = data['profinet_name']
                # response_data={data["T"],data["Tmin"],data["Tmax"],data["RH"],data["validity"],data["Time"]}
                tsensor = TemperatureSensor.objects.get(profinet_name=data_profinet)
                try:
                    if data["validity"] == "True":
                        TemperatureSensorValue.objects.create(temperaturesensor=tsensor, valid = True,\
                            tempvalue=data["T"],tempvalue_min=data["Tmin"],tempvalue_max=data["Tmax"],humidvalue=data["RH"],time=data["Time"])
                        response = {"message":"success"}
                        return Response(response, status=status.HTTP_200_OK)
                    elif data["validity"] == "False":
                        TemperatureSensorValue.objects.create(temperaturesensor=tsensor,tempvalue=data["T"],tempvalue_min=data["Tmin"],tempvalue_max=data["Tmax"],humidvalue=data["RH"]\
                            ,valid=False,time=data["Time"])
                        response = {"message": "success, Validity:False"}
                        return Response(response, status=status.HTTP_200_OK)
                except:
                    response = {"message": "Data does not match"}
                    # response = {{"message": "Data does not match"},response_data}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
            except:
                response = {"message": "Profinet_name for temperature sensor does not exist"}
                # response = {data_profinet:response_data}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {"message": "Data does not match"}
            # response = {{"message": "Data does not match"},response_data}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
################################################################
################################################################

    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def energy(self,request):
        data = request.data
        print(data)
        if "profinet_name" and "E" and "UnitE" and "P" and "UnitP" and "validity" and "Time" in data:
            try:
                data_profinet = data['profinet_name']
                # response_data={data["T"],data["Tmin"],data["Tmax"],data["RH"],data["validity"],data["Time"]}
                esensor = EnergySensor.objects.get(profinet_name=data_profinet)
                try:
                    if data["validity"] == "True":
                        EnergySensorValue.objects.create(energysensor=esensor, valid = True,\
                            energy_value=data["E"],energy_unit=data["UnitE"],power_value=data["P"],power_unit=data["UnitP"],time=data["Time"])
                        response = {"message":"success"}
                        return Response(response, status=status.HTTP_200_OK)
                    elif data["validity"] == "False":
                        EnergySensorValue.objects.create(energysensor=esensor,energy_value=data["E"],energy_unit=data["UnitE"],power_value=data["P"],power_unit=data["UnitP"]\
                            ,valid=False,time=data["Time"])
                        print("here")
                        response = {"message": "success, Validity:False"}
                        return Response(response, status=status.HTTP_200_OK)
                except:
                    response = {"message": "Data does not match"}
                    # response = {{"message": "Data does not match"},response_data}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
            except:
                response = {"message": "Profinet_name for energy sensor does not exist"}
                # response = {data_profinet:response_data}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {"message": "Data does not match"}
            # response = {{"message": "Data does not match"},response_data}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
################################################################
################################################################

    @csrf_exempt 
    @action(methods=['POST'],detail=False)
    def dido(self, request):
        # response_data={data["value"],data["validity"],data["Time"]}
        data = request.data
        if "profinet_name" and "value" and "validity" and "Time" in data:
            try:
                device_moduletype= Device.objects.get(profinet_name=data["profinet_name"]).module_type
                profinet_name_data = data["profinet_name"]
                print(device_moduletype)
        ################################################################
                if device_moduletype == "Door Sensor":
                    try:
                        doorsensor = DoorSensor.objects.get(profinet_name=profinet_name_data)
                        value=data["value"]
                        door = doorsensor.door
                        if data ["validity"] == "True":
                            DoorsensorValue.objects.create(doorsensor=doorsensor,value=value,valid=True, time = data["Time"])
                            if value=="open":
                                try:
                                    led = LED.objects.get(door =door)
                                    current_led_value = led_status_find(door=door)
                                    send_mqtt_led(led=led,\
                                        value=current_led_value, delay=0\
                                            ,delayed_value=LedValueCases.objects.get(description="default_open").value)
                                except:
                                    pass
                            elif value == "close":
                                try:
                                    led = LED.objects.get(door =door)
                                    current_led_value = led_status_find(door=door)
                                    send_mqtt_led(led=led,\
                                        value=current_led_value, delay=0\
                                            ,delayed_value=LedValueCases.objects.get(description="default").value)
                                except:
                                    pass
                                
                            response = {"message": "success"}
                            
                            return Response(response, status=status.HTTP_200_OK)
                        elif data ["validity"] == "False":
                            DoorsensorValue.objects.create(doorsensor=doorsensor,value=value,valid=False, time = data["Time"])
                            response = {"message": "success: Validity:False"}
                            return Response(response, status=status.HTTP_200_OK)
                    except:
                        response = {"message": "Data does not match"}
                        return Response(response, status=status.HTTP_400_BAD_REQUEST)
        ################################################################
                elif device_moduletype == "Door Button":
                    try:
                        doorbtn = DoorButton.objects.get(profinet_name=profinet_name_data)
                        print(doorbtn.bmk)
                        door = doorbtn.door
                        if data ["validity"] == "True":
                            value=ButtonValue.objects.create(doorbutton=doorbtn,value=data["value"], time = data["Time"], valid=True)
                            print(value.value)
                            #This will check for existing request for this door
                            try:
                                ### Here just checks for the request in the last one minute
                                current_time = timezone.now()
                                start_time = current_time - timezone.timedelta(minutes=1)
                                request = Request.objects.filter(door= door, sent_to_frontend=False,cancelled_by_frontend=False,button_pushed=False, access=True, time__range=[start_time,current_time]).latest("time")
                                request.button_pushed=True
                                request.save()
                                response = {"message": "success"}
                            except:
                                response = {"message": "success, no existing request found"}
                            return Response(response, status=status.HTTP_200_OK)
                        elif data ["validity"] == "False":
                            ButtonValue.objects.create(doorbutton=doorbtn, valid=False, time = data["Time"],value=data["value"])
                            response = {"message": "success, Validity:False"}
                            return Response(response, status=status.HTTP_200_OK)
                    except:
                        response = {"message": "Data does not match"}
                        return Response(response, status=status.HTTP_400_BAD_REQUEST)
        ####################################################################
                elif device_moduletype == "Latch":
                    
                    try:
                        this_latch = Latch.objects.get(profinet_name=profinet_name_data)
                        if data["validity"] == "True":
                            LatchValue.objects.create(latch=this_latch, value=data["value"], time = data["Time"], valid=True)
                            response = {"message": "success"}
                            return Response(response, status=status.HTTP_200_OK)
                        elif data["validity"] == "False":
                            LatchValue.objects.create(latch=this_latch,value=data["value"],valid=False, time = data["Time"])
                            response = {"message": "success, Validity:False"}
                            return Response(response, status=status.HTTP_200_OK)
                    except:
                        response = {"message": "Data does not match"}
                        return Response(response, status=status.HTTP_400_BAD_REQUEST)
        ########################################################################
                elif device_moduletype == "Latch Sensor":
                    try:
                        this_latchsensor = LatchSensor.objects.get(profinet_name=profinet_name_data)
                        if data ["validity"] == "True":
                            LatchSensorValue.objects.create(latchsensor=this_latchsensor,value=data["value"], time = data["Time"], valid=True)
                            response = {"message": "success"}
                            return Response(response, status=status.HTTP_200_OK)
                        elif data["validity"] == "False":
                            LatchSensorValue.objects.create(latchsensor=this_latchsensor,value=data["value"],valid=False, time = data["Time"])
                            response = {"message": "success, Validity:False"}
                            return Response(response, status=status.HTTP_200_OK)
                    except:
                        response = {"message": "Data does not match"}
                        return Response(response, status=status.HTTP_400_BAD_REQUEST)
                    
        ##########################################################################
                elif device_moduletype == "AC Alarm Sensor":
                    try:
                        this_acm = ACM.objects.get(profinet_name=profinet_name_data)
                        if data ["validity"] == "True":
                            ACMValue.objects.create(acm=this_acm,value=data["value"], time = data["Time"], valid=True)
                            response = {"message": "success"}
                            return Response(response, status=status.HTTP_200_OK)
                        elif data["validity"] == "False":
                            ACMValue.objects.create(acm=this_acm,value=data["value"],valid=False, time = data["Time"])
                            response = {"message": "success, Validity:False"}
                            return Response(response, status=status.HTTP_200_OK)
                    except:
                        response = {"message": "Data does not match"}
                        return Response(response, status=status.HTTP_400_BAD_REQUEST)
        #########################################################################
                elif device_moduletype == "LED":
                    try:
                        this_led = LED.objects.get(profinet_name=profinet_name_data)
                        print(this_led.port)
                        if data ["validity"] == "True":
                            print(data["value"], type(data["value"]))
                            int_value = int(data["value"])
                            print(int(data["value"]), type(int(data["value"])))
                            LedValue.objects.create(led=this_led,value=int(data["value"]), time = data["Time"], valid=True)
                            print("HEREES")
                            print(this_led.rack)
                            response = {"message": "success"}
                            return Response(response, status=status.HTTP_200_OK)
                        elif data ["validity"] == "False":
                            LedValue.objects.create(led=this_led,value=data["value"],valid=False, time = data["Time"])
                            response = {"message": "success, Validity:False"}
                            return Response(response, status=status.HTTP_200_OK)
                    except:
                        response = {"message": "Data does not match"}
                        return Response(response, status=status.HTTP_400_BAD_REQUEST)

        ##########################################################################
                # elif device_moduletype == "LED":
                #     try:
                #         this_led = LED.objects.get(profinet_name=profinet_name_data)
                #         if data ["validity"] == "True":
                #             LedValue.objects.create(led=this_led,value=data["value"], time = data["Time"], valid=True)
                #             response = {"message": "success"}
                #             return Response(response, status=status.HTTP_200_OK)
                #         elif data ["validity"] == "False":
                #             LedValue.objects.create(led=this_led,value=data["value"],valid=False, time = data["Time"])
                #             response = {"message": "success, Validity:False"}
                #             return Response(response, status=status.HTTP_200_OK)
                #     except:
                #         response = {"message": "Data does not match"}
                #         return Response(response, status=status.HTTP_400_BAD_REQUEST)
        ##########################################################################

                else:
                    response = {"message": "module not found in the database"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
            except:
                response = {"message": "This Profinet_name does not exist"}
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
        else:
            response = {"message": "Data does not match_Main"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)