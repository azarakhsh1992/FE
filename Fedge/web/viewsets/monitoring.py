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
                            "Temperature": latest_value_temperature.tempvalue,
                            "Humidity":latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }
                    elif "Edge_B" in sensor.measuring_environment:
                        key = sensor.measuring_environment.split("Edge_B_")[-1]
                        payload_tempB[key] = {
                            "Time": latest_value_temperature.time,
                            "Temperature": latest_value_temperature.tempvalue,
                            "Humidity":latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }

                    elif "Network" in sensor.measuring_environment:
                        key = sensor.measuring_environment.split("Network")[-1]
                        payload_tempN[key] = {
                            "Time": latest_value_temperature.time,
                            "Temperature": latest_value_temperature.tempvalue,
                            "Humidity":latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }

                    elif "Energy" in sensor.measuring_environment:
                        key = sensor.measuring_environment.split("Energy")[-1]
                        payload_tempE[key] = {
                            "Time": latest_value_temperature.time,
                            "Temperature": latest_value_temperature.tempvalue,
                            "Humidity":latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }
                payload_temp = {"Edge_A":payload_tempA,"Edge_B":payload_tempB,"Network":payload_tempN,"Energy":payload_tempE}

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
            
            payload_h_at ={}
            payload_d_at ={}
            payload_w_at ={}
            payload_m_at ={}
            payload_h_am ={}
            payload_d_am ={}
            payload_w_am ={}
            payload_m_am ={}
            payload_h_ab ={}
            payload_d_ab ={}
            payload_w_ab ={}
            payload_m_ab ={}
            
            payload_h_bt ={}
            payload_d_bt ={}
            payload_w_bt ={}
            payload_m_bt ={}
            payload_h_bm ={}
            payload_d_bm ={}
            payload_w_bm ={}
            payload_m_bm ={}
            payload_h_bb ={}
            payload_d_bb ={}
            payload_w_bb ={}
            payload_m_bb ={}
            
            payload_h_e ={}
            payload_d_e ={}
            payload_w_e ={}
            payload_m_e ={}
            
            payload_h_n={}
            payload_d_n ={}
            payload_w_n ={}
            payload_m_n ={}
            ###hour
            for period in ("hour","day","week","month"):
                if period == "hour":
                    start_time = current_time - timezone.timedelta(hours=1)
                elif period == "day":
                    start_time = current_time - timezone.timedelta(hours=24)
                elif period == "week":
                    start_time = current_time.replace(hour=0,minute=0,second=0,microsecond=0) - timezone.timedelta(days=current_time.weekday())
                elif period == "month":
                    start_time = current_time - timezone.timedelta(days=30)
                    
                for sensor in sensors.filter(measuring_environment__startswith= "Edge_A"):

                    filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor,time__range=[start_time,current_time], valid=True)
                    if filtered_values.exists():
                        
                        aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'),\
                                                                RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                        time_max_temp = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"]).latest("time").time
                        time_min_temp = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"]).latest("time").time
                        time_max_RH = filtered_values.filter(humidvalue = aggregated_values["RH_max"]).latest("time").time
                        time_min_RH = filtered_values.filter(humidvalue =aggregated_values["RH_min"]).latest("time").time
                        
                        payload={
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
                            }
                        if period == "hour" and sensor.measuring_environment == "Edge_A_top":
                            payload_h_at =payload
                        elif period == "day" and sensor.measuring_environment == "Edge_A_top":
                            payload_d_at =payload
                        elif period == "week" and sensor.measuring_environment == "Edge_A_top":
                            payload_w_at =payload
                        elif period == "month" and sensor.measuring_environment == "Edge_A_top":
                            payload_m_at =payload
                            
                        elif period == "hour" and sensor.measuring_environment == "Edge_A_middle":
                            payload_h_am =payload
                        elif period == "day" and sensor.measuring_environment == "Edge_A_middle":
                            payload_d_am =payload
                        elif period == "week" and sensor.measuring_environment == "Edge_A_middle":
                            payload_w_am =payload
                        elif period == "month" and sensor.measuring_environment == "Edge_A_middle":
                            payload_m_am =payload
                            
                        elif period == "hour" and sensor.measuring_environment == "Edge_A_bottom":
                            payload_h_ab =payload
                        elif period == "day" and sensor.measuring_environment == "Edge_A_bottom":
                            payload_d_ab =payload
                        elif period == "week" and sensor.measuring_environment == "Edge_A_bottom":
                            payload_w_ab =payload
                        elif period == "month" and sensor.measuring_environment == "Edge_A_bottom":
                            payload_m_ab =payload
                            
                        else:
                            pass
            
                for sensor in sensors.filter(measuring_environment__startswith= "Edge_B"):
                    filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor,time__range=[start_time,current_time], valid=True)
                    if filtered_values.exists():
                        
                        aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'),\
                                                                RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                        time_max_temp = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"]).latest("time").time
                        time_min_temp = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"]).latest("time").time
                        time_max_RH = filtered_values.filter(humidvalue = aggregated_values["RH_max"]).latest("time").time
                        time_min_RH = filtered_values.filter(humidvalue =aggregated_values["RH_min"]).latest("time").time
                        
                        payload={
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
                            }
                        if period == "hour" and sensor.measuring_environment == "Edge_B_top":
                            payload_h_bt =payload
                        elif period == "day" and sensor.measuring_environment == "Edge_B_top":
                            payload_d_bt =payload
                        elif period == "week" and sensor.measuring_environment == "Edge_B_top":
                            payload_w_bt =payload
                        elif period == "month" and sensor.measuring_environment == "Edge_B_top":
                            payload_m_bt =payload
                            
                        elif period == "hour" and sensor.measuring_environment == "Edge_B_middle":
                            payload_h_bm =payload
                        elif period == "day" and sensor.measuring_environment == "Edge_B_middle":
                            payload_d_bm =payload
                        elif period == "week" and sensor.measuring_environment == "Edge_B_middle":
                            payload_w_bm =payload
                        elif period == "month" and sensor.measuring_environment == "Edge_B_middle":
                            payload_m_bm =payload
                            
                        elif period == "hour" and sensor.measuring_environment == "Edge_B_bottom":
                            payload_h_bb =payload
                        elif period == "day" and sensor.measuring_environment == "Edge_B_bottom":
                            payload_d_bb =payload
                        elif period == "week" and sensor.measuring_environment == "Edge_B_bottom":
                            payload_w_bb =payload
                        elif period == "month" and sensor.measuring_environment == "Edge_B_bottom":
                            payload_m_bb =payload
                        else:
                            pass
                for sensor in sensors.filter(measuring_environment__startswith= "Energy"):
                    filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor,time__range=[start_time,current_time], valid=True)
                    if filtered_values.exists():
                        
                        aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'),\
                                                                RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                        time_max_temp = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"]).latest("time").time
                        time_min_temp = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"]).latest("time").time
                        time_max_RH = filtered_values.filter(humidvalue = aggregated_values["RH_max"]).latest("time").time
                        time_min_RH = filtered_values.filter(humidvalue =aggregated_values["RH_min"]).latest("time").time
                        
                        payload={
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
                            }
                        if period == "hour" and sensor.measuring_environment == "Energy":
                            payload_h_e =payload
                        elif period == "day" and sensor.measuring_environment == "Energy":
                            payload_d_e =payload
                        elif period == "week" and sensor.measuring_environment == "Energy":
                            payload_w_e =payload
                        elif period == "month" and sensor.measuring_environment == "Energy":
                            payload_m_e =payload
                        else:
                            pass
                for sensor in sensors.filter(measuring_environment__startswith= "Network"):
                    filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor,time__range=[start_time,current_time], valid=True)
                    if filtered_values.exists():
                        
                        aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'),\
                                                                RH_min=Min('humidvalue'), RH_max=Max('humidvalue'),RH_avg=Avg('humidvalue'))
                        time_max_temp = filtered_values.filter(tempvalue_max =aggregated_values["temp_max"]).latest("time").time
                        time_min_temp = filtered_values.filter(tempvalue_min =aggregated_values["temp_min"]).latest("time").time
                        time_max_RH = filtered_values.filter(humidvalue = aggregated_values["RH_max"]).latest("time").time
                        time_min_RH = filtered_values.filter(humidvalue =aggregated_values["RH_min"]).latest("time").time
                        
                        payload={
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
                            }
                        if period == "hour" and sensor.measuring_environment == "Network":
                            payload_h_n=payload
                        elif period == "day" and sensor.measuring_environment == "Network":
                            payload_d_n =payload
                        elif period == "week" and sensor.measuring_environment == "Network":
                            payload_w_n =payload
                        elif period == "month" and sensor.measuring_environment == "Network":
                            payload_m_n =payload
                        else:
                            pass
            response = {"Edge_A":{
                "top":{
                    "hour":
                        payload_h_at
                    ,
                    "day":
                        payload_d_at
                    ,
                    "week":
                        payload_w_at
                    ,
                    "month":
                        payload_m_at
                    },
                "middle":{
                    "hour":
                        payload_h_am
                    ,
                    "day":
                        payload_d_am
                    ,
                    "week":
                        payload_w_am
                    ,
                    "month":
                        payload_m_am
                    },
                "bottom":{
                    "hour":
                        payload_h_ab
                    ,
                    "day":
                        payload_d_ab
                    ,
                    "week":
                        payload_w_ab
                    ,
                    "month":
                        payload_m_ab
                    },
                    },
                        "Edge_B":{
                "top":{
                    "hour":
                        payload_h_bt
                    ,
                    "day":
                        payload_d_bt
                    ,
                    "week":
                        payload_w_bt
                    ,
                    "month":
                        payload_m_bt
                    },
                "middle":{
                    "hour":
                        payload_h_bm
                    ,
                    "day":
                        payload_d_bm
                    ,
                    "week":
                        payload_w_bm
                    ,
                    "month":
                        payload_m_bm
                    },
                "bottom":{
                    "hour":
                        payload_h_bb
                    ,
                    "day":
                        payload_d_bb
                    ,
                    "week":
                        payload_w_bb
                    ,
                    "month":
                        payload_m_bb
                    },
                    },
                        "Energy":{
                "":{
                    "hour":
                        payload_h_e
                    ,
                    "day":
                        payload_d_e
                    ,
                    "week":
                        payload_w_e
                    ,
                    "month":
                        payload_m_e
                    },
                    },
                        "Network":{
                "":{
                    "hour":
                        payload_h_n
                    ,
                    "day":
                        payload_d_n
                    ,
                    "week":
                        payload_w_n
                    ,
                    "month":
                        payload_m_n
                    },
                    }
                        }
            return Response(response, status=status.HTTP_200_OK)
        
        except Exception as e:
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
        
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def history_energy(self,request):
        response={}
        try:
            data = request.data
            door = Door.objects.get(qr=request.data["qr"])
            plc = PLC.objects.get(cabinet=door.rack.cabinet)
            sensors = EnergySensor.objects.filter(plc =plc)
            current_time = timezone.now()
            response ={}
            payload ={}
            payload_h_e1 = {}
            payload_d_e1 = {}
            payload_w_e1 = {}
            payload_m_e1 = {}
            
            payload_h_e2 = {}
            payload_d_e2 = {}
            payload_w_e2 = {}
            payload_m_e2 = {}
            for period in ("hour","day","week","month"):
                if period == "hour":
                    start_time = current_time - timezone.timedelta(hours=1)
                elif period == "day":
                    start_time = current_time - timezone.timedelta(hours=24)
                elif period == "week":
                    start_time = current_time.replace(hour=0,minute=0,second=0,microsecond=0) - timezone.timedelta(days=current_time.weekday())
                elif period == "month":
                    start_time = current_time - timezone.timedelta(days=30)
                    
                for sensor in sensors.filter(measuring_environment__startswith= "EM1"):
                    
                    filtered_values = EnergySensorValue.objects.filter(energysensor=sensor,time__range=[start_time,current_time], valid=True)
                    if filtered_values.exists():
                        aggregated_values = filtered_values.aggregate(power_min=Min('power_value'), power_max=Max('power_value'),power_avg=Avg('power_value'),energy_avg=Avg('energy_value'))
                        
                        time_power_max = filtered_values.filter(power_value =aggregated_values["power_max"]).latest("time").time
                        time_power_min = filtered_values.filter(power_value =aggregated_values["power_min"]).latest("time").time

                        payload = {
                            "Minimum Power":aggregated_values["power_min"],
                            "last time at minimum power":time_power_min,
                            "Maximum Power":aggregated_values["power_max"],
                            "last time at maximum power":time_power_max,
                            "Average Power":aggregated_values["power_avg"],
                            "Average Energy":aggregated_values["energy_avg"]
                            }

                        if period == "hour":
                            payload_h_e1 =payload
                        elif period == "day":
                            payload_d_e1 =payload
                        elif period == "week":
                            payload_w_e1 =payload
                        elif period == "month":
                            payload_m_e1 =payload
                        else:
                            pass

                for sensor in sensors.filter(measuring_environment__startswith= "EM2"):
                    
                    filtered_values = EnergySensorValue.objects.filter(energysensor=sensor,time__range=[start_time,current_time], valid=True)
                    
                    if filtered_values.exists():

                        aggregated_values = filtered_values.aggregate(power_min=Min('power_value'), power_max=Max('power_value'),power_avg=Avg('power_value'),energy_avg=Avg('energy_value'))
                        
                        time_power_max = filtered_values.filter(power_value =aggregated_values["power_max"]).latest("time").time
                        time_power_min = filtered_values.filter(power_value =aggregated_values["power_min"]).latest("time").time

                        payload = {
                            "Minimum Power":aggregated_values["power_min"],
                            "last time at minimum power":time_power_min,
                            "Maximum Power":aggregated_values["power_max"],
                            "last time at maximum power":time_power_max,
                            "Average Power":aggregated_values["power_avg"],
                            "Average Energy":aggregated_values["energy_avg"]
                            }
                        if period == "hour":
                            payload_h_e2 =payload
                        elif period == "day":
                            payload_d_e2 =payload
                        elif period == "week":
                            payload_w_e2 =payload
                        elif period == "month":
                            payload_m_e2 =payload
                        else:
                            pass

            response = {"EM1":{
                "":{
                    "hour":
                        payload_h_e1
                    ,
                    "day":
                        payload_d_e1
                    ,
                    "week":
                        payload_w_e1
                    ,
                    "month":
                        payload_m_e1
                    }},
                        "EM2":{
                "":{
                    "hour":
                        payload_h_e2
                    ,
                    "day":
                        payload_d_e2
                    ,
                    "week":
                        payload_w_e2
                    ,
                    "month":
                        payload_m_e2
                    }}
                        }
            return Response(response, status=status.HTTP_200_OK)
        
        except Exception as e:
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)

    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def cabinet_status_monitoring(self,request):
        data = request.data
        try:    
            door = Door.objects.get(qr=request.data["qr"])
            plc = PLC.objects.get(cabinet=door.rack.cabinet)
            current_time = timezone.now()
            response ={}
        except Exception as e:
            print(e)  # or use logging
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
    
    @csrf_exempt
    @action(methods=['POST'], detail=False)
    def history_doorsensor(self,request):
        response={}
        try:
            data = request.data
            door = Door.objects.get(qr=request.data["qr"])
            plc = PLC.objects.get(cabinet=door.rack.cabinet)
            sensors = DoorSensor.objects.filter(plc = plc)
            current_time = timezone.now()
            response ={}
            payload ={}
                        
            payload_AF = {}
            payload_AR = {}
            payload_BF = {}
            payload_BR = {}
            payload_N = {}
            payload_E = {}
            payload_CF = {}
            payload_CR = {}
            for sensor in sensors:
                
                filtered_values = DoorsensorValue.objects.filter(doorsensor=sensor, valid=True).order_by('-time')[:11]

                if filtered_values.exists():
                    for i in range(0,10):
                        try:
                            door_status = filtered_values[i].value
                            time1 = filtered_values[i].time
                            time2 = filtered_values[i+1].time
                            payload.update({i+1:{
                                "status":door_status,
                                "from":time1,
                                "to":time2,
                                }})
                        except:
                            payload.update({i+1:{
                                "status":"-",
                                "from":"-",
                                "to":"-",
                                }})
                            
                    if sensor.door.rack.name=="Edge_A" and sensor.door_direction=="Front":
                        payload_AF.update(payload)
                    if sensor.door.rack.name=="Edge_A" and sensor.door_direction=="Rear":
                        payload_AR.update(payload)
                    if sensor.door.rack.name=="Edge_B" and sensor.door_direction=="Front":
                        payload_BF.update(payload)
                    if sensor.door.rack.name=="Edge_B" and sensor.door_direction=="Rear":
                        payload_BR.update(payload)
                    if sensor.door.rack.name=="Network" and sensor.door_direction=="Network":
                        payload_N.update(payload)
                    if sensor.door.rack.name=="Energy" and sensor.door_direction=="Energy":
                        payload_E.update(payload)
                    if sensor.door.rack.name=="Cooling" and sensor.door_direction=="Front":
                        payload_CF.update(payload)
                    if sensor.door.rack.name=="Cooling" and sensor.door_direction=="Rear":
                        payload_CR.update(payload)
                    
                    
            response = {
                "Edge_A Front":payload_AF,
                "Edge_A Rear": payload_AR,
                "Edge_B_Front": payload_BF,
                "Edge_B Rear": payload_BR,
                "Network": payload_N,
                "Energy": payload_E,
                "Cooling Front": payload_CF,
                "Cooling Rear": payload_CR
            }

            return Response(response, status=status.HTTP_200_OK)
        except Exception as e:
            response = {"message": "Data does not match"}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
