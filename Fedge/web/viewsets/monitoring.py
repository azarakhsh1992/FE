from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from ..mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from ..mainmodels.equipment.energymodule import EnergySensor,EnergySensorValue
from ..mainmodels.equipment.doorsensor import DoorSensor,DoorsensorValue
from ..mainmodels.equipment.plc import PLC
from ..mainmodels.cabinetlevel.doors import Door
from django.views.decorators.csrf import csrf_exempt
from django.utils import timezone
from django.db.models import Min, Max, Avg
import datetime



class Monitoring(viewsets.ModelViewSet):
    queryset = Door.objects.all()
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def monitoring_current_data(self,request):
        data = request.data
        response ={}
        try:
            current_time =timezone.now()
            qrcode = data["qr"]
            this_plc = PLC.objects.get(cabinet = Door.objects.get(qr=qrcode).rack.cabinet)
            payload_temp ={}
            payload_energy ={}
            payload_doorsensor ={}
            temperature_sensors = TemperatureSensor.objects.filter(plc = this_plc)
            energy_sensors = EnergySensor.objects.filter(plc = this_plc)
            door_sensors = DoorSensor.objects.filter(plc = this_plc)
            keyAB = {"Top","middle","Bottom"}
            keyNE = {""}
            payload_tempA = {}
            payload_tempB = {}
            payload_tempN = {}
            payload_tempE = {}

            for sensor in energy_sensors:
                values = EnergySensorValue.objects.filter(energysensor=sensor, valid=True, time__lte=current_time)
                if values.exists():
                    latest_value_energy = values.latest("time")
                    payload_energy.update({
                        sensor.measuring_environment:
                    {
                        "Time":latest_value_energy.time,
                        "Energy":latest_value_energy.energy_value,
                        "UnitE":latest_value_energy.energy_unit,
                        "Power":latest_value_energy.power_value,
                        "UnitP":latest_value_energy.power_unit,
                        "Validity":latest_value_energy.valid
                    }
                    })
                else:
                    print(f"No data for energy sensor {sensor}")
                    
            for sensor in temperature_sensors:
                values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, valid=True, time__lte=current_time)
                if values.exists():
                    latest_value_temperature = values.latest("time")
                    if "Edge_A" in sensor.measuring_environment:
                        key = sensor.measuring_environment.split("Edge_A_")[-1]
                        payload_tempA[key] = {
                            "Time": latest_value_temperature.time,
                            "Current": latest_value_temperature.tempvalue,
                            "Humidity":latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }
                    elif "Edge_B" in sensor.measuring_environment:
                        key = sensor.measuring_environment.split("Edge_B_")[-1]
                        payload_tempB[key] = {
                            "Time": latest_value_temperature.time,
                            "Current": latest_value_temperature.tempvalue,
                            "Humidity":latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }

                    elif "Network" in sensor.measuring_environment:
                        key = sensor.measuring_environment.split("Network")[-1]
                        payload_tempN[key] = {
                            "Time": latest_value_temperature.time,
                            "Current": latest_value_temperature.tempvalue,
                            "Humidity":latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }

                    elif "Energy" in sensor.measuring_environment:
                        key = sensor.measuring_environment.split("Energy")[-1]
                        payload_tempE[key] = {
                            "Time": latest_value_temperature.time,
                            "Current": latest_value_temperature.tempvalue,
                            "Humidity":latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }
                payload_temp = {"Edge_A":payload_tempA,"Edge_B":payload_tempB,"Network":payload_tempN,"Energy":payload_tempE}

            # for i in temperature_sensors:
            #     start_time = current_time - timezone.timedelta(hours=24)
            #     values = TemperatureSensorValue.objects.filter(temperaturesensor=i, valid=True, time__lte=current_time)
            #     if values.exists():
            #         latest_value_temperature = values.latest("time")
            #         payload_temp.update({
            #             i.measuring_environment:
            #         {
            #             "Time":latest_value_temperature.time,
            #             "Current":latest_value_temperature.tempvalue,
            #             "Max":latest_value_temperature.tempvalue_max,
            #             "Min":latest_value_temperature.humidvalue,
            #             "Validity":latest_value_temperature.valid
            #         }
            #         })
            #     else:
            #         print(f"No data for temperature sensor {i}")

            for sensor in door_sensors:
                values = DoorsensorValue.objects.filter(doorsensor=sensor, valid=True, time__lte=current_time)
                if values.exists():
                    latest_value_sensors = values.latest("time")
                    payload_doorsensor.update({
                        sensor.door.rack.name+'_'+sensor.door.direction: {
                            "Time": latest_value_sensors.time,
                            "Current": latest_value_sensors.value,
                            "Validity": latest_value_sensors.valid
                        }
                    })
                else:
                    print(f"No data for door sensor {sensor}")

            response = {"Temperature":payload_temp, "Energy":payload_energy, "Door_Sensors": payload_doorsensor}
            return Response(response, status=status.HTTP_200_OK)
        
        except Exception as e:
            print(e)  # or use logging
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def history_temp(self,request):
        response={}
        try:
            data = request.data
            # measuring_env=data["measuring_env"]
            door = Door.objects.get(qr=request.data["qr"])
            plc= PLC.objects.get(cabinet=door.rack.cabinet)
            sensors = TemperatureSensor.objects.filter(plc = plc)
            current_time = timezone.now()
            response ={}
            payload_tempA = {}
            payload_tempB = {}
            payload_tempN_h = {}
            payload_tempE_h = {}
            payload_tempA_d = {}
            response_period = {}
            payload_tempN_d = {}
            payload_tempE_d = {}
            payload_tempA_w = {}
            payload_tempB_w = {}
            payload_tempN_w = {}
            payload_tempE_w = {}
            payload_tempA_m = {}
            payload_tempB_m = {}
            payload_tempN_m = {}
            payload_tempE_m = {}
        ###hour
            for period in ("hour","day","week","month"):
                print("first for")
                try:
                    if period == "hour":
                        start_time = current_time - timezone.timedelta(hours=1)
                    elif period == "day":
                        start_time = current_time - timezone.timedelta(hours=24)
                    elif period == "week":
                        start_time = current_time.replace(hour=0,minute=0,second=0,microsecond=0) - timezone.timedelta(days=current_time.weekday())
                    elif period == "month":
                        start_time = current_time - timezone.timedelta(days=30)
                    for sensor in sensors.filter(measuring_environment__startswith= "Edge_A_"):
                        print("second for")
                        filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor,time__range=[start_time,current_time], valid=True)
                        if filtered_values.exists():
                            aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'),\
                                                                    RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                            print(period,start_time)
                            time_max_temp = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                            time_min_temp = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                            time_max_RH = filtered_values.filter(humidvalue = aggregated_values["RH_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                            time_min_RH = filtered_values.filter(humidvalue =aggregated_values["RH_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                            payload_tempA.update({(sensor.measuring_environment.replace("Edge_A_", "")):{
                                "Minimum temperature":round(aggregated_values["temp_min"],2),
                                "last time at minimum temperature":time_min_temp,
                                "Maximum temperature":round(aggregated_values["temp_max"], 2),
                                "last time at maximum temperature":time_max_temp,
                                "Average temperature":round(aggregated_values["temp_avg"],2),
                                "Minimum humidity":round(aggregated_values["RH_min"],2),
                                "last time at minimum humidity":time_min_RH,
                                "Maximum humidity":round(aggregated_values["RH_max"], 2),
                                "last time at maximum humidity":time_max_RH,
                                "Average humidity":round(aggregated_values["RH_avg"],2)
                                }})
                        response_period = response_period.update({"Edge_B":payload_tempB})
                    for sensor in sensors.filter(measuring_environment__startswith = "Edge_B"):
                        filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor,time__range=[start_time,current_time], valid=True)
                        if filtered_values.exists():
                            aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'),\
                                                                    RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                            time_max_temp = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                            time_min_temp = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                            time_max_RH = filtered_values.filter(humidvalue = aggregated_values["RH_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                            time_min_RH = filtered_values.filter(humidvalue =aggregated_values["RH_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                            payload_tempB.update({(sensor.measuring_environment.replace("Edge_B_", "")):{
                                "Minimum temperature":round(aggregated_values["temp_min"],2),
                                "last time at minimum temperature":time_min_temp,
                                "Maximum temperature":round(aggregated_values["temp_max"], 2),
                                "last time at maximum temperature":time_max_temp,
                                "Average temperature":round(aggregated_values["temp_avg"],2),
                                "Minimum humidity":round(aggregated_values["RH_min"],2),
                                "last time at minimum humidity":time_min_RH,
                                "Maximum humidity":round(aggregated_values["RH_max"], 2),
                                "last time at maximum humidity":time_max_RH,
                                "Average humidity":round(aggregated_values["RH_avg"],2)
                                }})
                            response_period = response_period.update({"Edge_B":payload_tempB})
                    response=response.update({period:response_period})
                    return Response(response, status=status.HTTP_200_OK)
                except Exception as e:
                    response = {"message": "value not found"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
                    
                
                
            ###day
        #     try:
        #         start_time = current_time - timezone.timedelta(hours=24)
        #         filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__range=[start_time,current_time], valid=True)
        #         aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'))
        #         time_max = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"],time__range=[start_time,current_time], valid=True).latest("time").time
        #         time_min = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"],time__range=[start_time,current_time], valid=True).latest("time").time
        #         response = {"Minimum":round(aggregated_values["temp_min"],2),"last time at minimum":time_min, "Maximum":round(aggregated_values["temp_max"], 2),"last time at maximum":time_max, "Average":round(aggregated_values["temp_avg"],2)}
        #         # return Response(response, status=status.HTTP_200_OK)
        #     except Exception as e:
        #         response = {"message": "value not found"}
        #         # return Response(response, status=status.HTTP_400_BAD_REQUEST)
            
        #     ###week
        #     try:
        #         start_time = current_time.replace(hour=0,minute=0,second=0,microsecond=0) - timezone.timedelta(days=current_time.weekday())
        #         filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__range=[start_time,current_time], valid=True)
        #         aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'))
        #         time_max = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"],time__range=[start_time,current_time], valid=True).latest("time").time
        #         time_min = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"],time__range=[start_time,current_time], valid=True).latest("time").time
        #         response = {"Minimum":round(aggregated_values["temp_min"],2),"last time at minimum":time_min, "Maximum":round(aggregated_values["temp_max"], 2),"last time at maximum":time_max, "Average":round(aggregated_values["temp_avg"],2)}
        #         # return Response(response, status=status.HTTP_200_OK)
        #     except Exception as e:
        #         response = {"message": "value not found"}
        #         # return Response(response, status=status.HTTP_400_BAD_REQUEST)
        
        #     ###month
        #     try:
        #         start_time = current_time - timezone.timedelta(days=30)
        #         filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__range=[start_time,current_time], valid=True)
        #         aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'))
        #         time_max = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"],time__range=[start_time,current_time], valid=True).latest("time").time
        #         time_min = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"],time__range=[start_time,current_time], valid=True).latest("time").time
        #         response = {"Minimum":round(aggregated_values["temp_min"],2),"last time at minimum":time_min, "Maximum":round(aggregated_values["temp_max"], 2),"last time at maximum":time_max, "Average":round(aggregated_values["temp_avg"],2)}
        #         # return Response(response, status=status.HTTP_200_OK)
        #     except Exception as e:
        #         response = {"message": "value not found"}
        #         # return Response(response, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            print(e)  # or use logging
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
        
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def history_RH(self,request):
        response={}
        try:
            data = request.data
            measuring_env=data["measuring_env"]
            period=data["period"]
            door = Door.objects.get(qr=request.data["qr"])
            sensor = TemperatureSensor.objects.get(rack =door.rack, measuring_environment=measuring_env)
            current_time = timezone.now()
            response ={}
            
            ##hour
            try:
                start_time = current_time - timezone.timedelta(hours=1)
                print(start_time)
                print(current_time)
                filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor,time__range=[start_time,current_time], valid=True)
                aggregated_values = filtered_values.aggregate(RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                time_max = filtered_values.filter(humidvalue = aggregated_values["RH_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                time_min = filtered_values.filter(tempvalue_min =aggregated_values["RH_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                response = {"Minimum":round(aggregated_values["RH_min"],2),"last time at minimum":time_min, "Maximum":round(aggregated_values["RH_max"], 2),"last time at maximum":time_max, "Average":round(aggregated_values["RH_avg"],2)}
                # return Response(response, status=status.HTTP_200_OK)
            except Exception as e:
                response = {"message": "value not found"}
                # return Response(response, status=status.HTTP_400_BAD_REQUEST)
            ##day
            try:
                start_time = current_time - timezone.timedelta(hours=24)
                filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__range=[start_time,current_time], valid=True)
                aggregated_values = filtered_values.aggregate(RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                time_max = filtered_values.filter(humidvalue = aggregated_values["RH_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                time_min = filtered_values.filter(humidvalue = aggregated_values["RH_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                response = {"Minimum":round(aggregated_values["RH_min"],2),"last time at minimum":time_min, "Maximum":round(aggregated_values["RH_max"], 2),"last time at maximum":time_max, "Average":round(aggregated_values["RH_avg"],2)}
                # return Response(response, status=status.HTTP_200_OK)
            except Exception as e:
                response = {"message": "value not found"}
                # return Response(response, status=status.HTTP_400_BAD_REQUEST)
            
            ##week
            try:
                start_time = current_time.replace(hour=0,minute=0,second=0,microsecond=0) - timezone.timedelta(days=current_time.weekday())
                filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__range=[start_time,current_time], valid=True)
                aggregated_values = filtered_values.aggregate(RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                time_max = filtered_values.filter(humidvalue = aggregated_values["RH_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                time_min = filtered_values.filter(humidvalue = aggregated_values["RH_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                response = {"Minimum":round(aggregated_values["RH_min"],2),"last time at minimum":time_min, "Maximum":round(aggregated_values["RH_max"], 2),"last time at maximum":time_max, "Average":round(aggregated_values["RH_avg"],2)}
                # return Response(response, status=status.HTTP_200_OK)
            except Exception as e:
                response = {"message": "value not found"}
                # # return Response(response, status=status.HTTP_400_BAD_REQUEST)
        
            ##month
            try:
                start_time = current_time - timezone.timedelta(days=30)
                filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__range=[start_time,current_time], valid=True)
                aggregated_values = filtered_values.aggregate(RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                time_max = filtered_values.filter(humidvalue = aggregated_values["RH_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                time_min = filtered_values.filter(humidvalue = aggregated_values["RH_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                response = {"Minimum":round(aggregated_values["RH_min"],2),"last time at minimum":time_min, "Maximum":round(aggregated_values["RH_max"], 2),"last time at maximum":time_max, "Average":round(aggregated_values["RH_avg"],2)}
                # return Response(response, status=status.HTTP_200_OK)
            except Exception as e:
                response = {"message": "value not found"}
                # return Response(response, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            print(e)  # or use logging
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
        
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def history_energy(self,request):
        response={}
        try:
            data = request.data
            measuring_env=data["measuring_env"]
            period=data["period"]
            door = Door.objects.get(qr=request.data["qr"])
            plc = PLC.objects.get(cabinet=door.rack.cabinet)
            sensor = EnergySensor.objects.get(plc =plc, measuring_environment=measuring_env)
            current_time = timezone.now()
            response ={}
            
            if period == "hour":
                try:
                    start_time = current_time - timezone.timedelta(hours=1)
                    filtered_values = EnergySensorValue.objects.filter(energysensor=sensor,time__range=[start_time,current_time], valid=True)
                    aggregated_values = filtered_values.aggregate(power_min=Min('power_value'), power_max=Max('power_value'),power_avg=Avg('power_value'),energy_avg=Avg('energy_value'))
                    time_power_max = filtered_values.filter(power_value =aggregated_values["power_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                    time_power_min = filtered_values.filter(power_value =aggregated_values["power_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                    response = {
                        "Minimum Power":round(aggregated_values["power_min"],3),
                        "last time at minimum power":time_power_min,
                        "Maximum Power":round(aggregated_values["power_max"],3),
                        "last time at maximum power":time_power_max,
                        "Average Power":round(aggregated_values["power_avg"],3),
                        "Average Energy":round(aggregated_values["energy_avg"],3)
                        }
                    return Response(response, status=status.HTTP_200_OK)
                except Exception as e:
                    response = {"message": "value not found"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
            if period == "day":
                try:
                    start_time = current_time - timezone.timedelta(hours=24)
                    filtered_values = EnergySensorValue.objects.filter(energysensor=sensor,time__range=[start_time,current_time], valid=True)
                    aggregated_values = filtered_values.aggregate(power_min=Min('power_value'), power_max=Max('power_value'),power_avg=Avg('power_value'),energy_avg=Avg('energy_value'))
                    time_power_max = filtered_values.filter(power_value =aggregated_values["power_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                    time_power_min = filtered_values.filter(power_value =aggregated_values["power_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                    response = {
                        "Minimum Power":round(aggregated_values["power_min"],3),
                        "last time at minimum power":time_power_min,
                        "Maximum Power":round(aggregated_values["power_max"],3),
                        "last time at maximum power":time_power_max,
                        "Average Power":round(aggregated_values["power_avg"],3),
                        "Average Energy":round(aggregated_values["energy_avg"],3)
                        }
                    return Response(response, status=status.HTTP_200_OK)
                except Exception as e:
                    response = {"message": "value not found"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
                
            if period == "week":
                try:
                    filtered_values = EnergySensorValue.objects.filter(energysensor=sensor,time__range=[start_time,current_time], valid=True)
                    aggregated_values = filtered_values.aggregate(power_min=Min('power_value'), power_max=Max('power_value'),power_avg=Avg('power_value'),energy_avg=Avg('energy_value'))
                    time_power_max = filtered_values.filter(power_value =aggregated_values["power_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                    time_power_min = filtered_values.filter(power_value =aggregated_values["power_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                    response = {
                        "Minimum Power":round(aggregated_values["power_min"],3),
                        "last time at minimum power":time_power_min,
                        "Maximum Power":round(aggregated_values["power_max"],3),
                        "last time at maximum power":time_power_max,
                        "Average Power":round(aggregated_values["power_avg"],3),
                        "Average Energy":round(aggregated_values["energy_avg"],3)
                        }
                    return Response(response, status=status.HTTP_200_OK)
                except Exception as e:
                    response = {"message": "value not found"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
            
            if period == "month":
                try:
                    start_time = current_time - timezone.timedelta(days=30)
                    filtered_values = EnergySensorValue.objects.filter(energysensor=sensor,time__range=[start_time,current_time], valid=True)
                    aggregated_values = filtered_values.aggregate(power_min=Min('power_value'), power_max=Max('power_value'),power_avg=Avg('power_value'),energy_avg=Avg('energy_value'))
                    time_power_max = filtered_values.filter(power_value =aggregated_values["power_max"],time__range=[start_time,current_time], valid=True).latest("time").time
                    time_power_min = filtered_values.filter(power_value =aggregated_values["power_min"],time__range=[start_time,current_time], valid=True).latest("time").time
                    response = {
                        "Minimum Power":round(aggregated_values["power_min"],3),
                        "last time at minimum power":time_power_min,
                        "Maximum Power":round(aggregated_values["power_max"],3),
                        "last time at maximum power":time_power_max,
                        "Average Power":round(aggregated_values["power_avg"],3),
                        "Average Energy":round(aggregated_values["energy_avg"],3)
                        }
                    return Response(response, status=status.HTTP_200_OK)
                except Exception as e:
                    response = {"message": "value not found"}
                    return Response(response, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            print(e)  # or use logging
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def cabinet_status_monitoring(self,request):
        data = request.data
        try:    
            door = Door.objects.get(qr=request.data["qr"])
            plc = PLC.objects.get(cabinet=door.rack.cabinet)
            sensor = EnergySensor.objects.get(plc =plc, measuring_environment=measuring_env)
            current_time = timezone.now()
            response ={}
        except Exception as e:
            print(e)  # or use logging
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
            