from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from mainmodels.equipment.energymodule import EnergySensor,EnergySensorValue
from mainmodels.equipment.doorsensor import DoorSensor,DoorsensorValue
from mainmodels.equipment.plc import PLC
from mainmodels.cabinetlevel.doors import Door
from django.views.decorators.csrf import csrf_exempt
from django.utils import timezone
import datetime
from django.db.models import Min, Max, Avg


def get_history_temp(profinet_name, period):
    payload_temp ={}
    sensor = TemperatureSensor.objects.get(profinet_name=profinet_name)
    current_time = datetime.datetime.now()
    
    if period == "hour":
        last_hour = current_time - datetime.timedelta(hours=1)
        filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor,time__range=[last_hour,current_time])
    
    if period == "day":
        filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__date=current_time.date())
        aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'))
        payload_temp = {"Minimum":aggregated_values["temp_min"], "Maximum":aggregated_values["temp_max"], "Average":aggregated_values["temp_avg"]}
    
    if period == "week":
        start_of_week = current_time.replace(hour=0,minute=0,second=0,microsecond=0) - datetime.timedelta(days=current_time.weekday())
        filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__range=[start_of_week,current_time])
        aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'))
        payload_temp = {"Minimum":aggregated_values["temp_min"], "Maximum":aggregated_values["temp_max"], "Average":aggregated_values["temp_avg"]}
    if period == "month":
        start_of_month = current_time.replace(day=1,hour=0,minute=0,second=0,microsecond=0)
        filtered_values = TemperatureSensorValue.objects.filter(temperaturesensor=sensor, time__range=[start_of_month,current_time])
        aggregated_values = filtered_values.aggregate(temp_min=Min('tempvalue_min'), temp_max=Max('tempvalue_max'),temp_avg=Avg('tempvalue'))
        payload_temp = {"Minimum":aggregated_values["temp_min"], "Maximum":aggregated_values["temp_max"], "Average":aggregated_values["temp_avg"]}
    return payload_temp