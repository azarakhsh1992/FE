from django.db import models
from ..cabinetlevel.cabinets import Cabinet
from ..equipment.plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from ..userrelated.users import User
from ..equipment.doorsensor import DoorSensor, DoorsensorValue
from django.utils import timezone

def is_safe(this_door):
    current_time = timezone.now()
    critical_value = 60
    door = Door.objects.get(id=this_door.id)
    plc= PLC.objects.get(cabinet=door.rack.cabinet)
    rack = door.rack.name
    response = ""
    temperaturesensor1 = None
    temperaturesensor2 = None
    temperaturesensor3 = None
    access = False
    
    if rack == "Edge_A":
        try:
            temperaturesensor1= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_A_top')
            temperaturesensor2= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_A_middle')
            temperaturesensor3= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_A_bottom')
        except:
            response = 'error: Temperature sensor not found'
    elif rack == "Edge_B":
        try:
            temperaturesensor1= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_B_top')
            temperaturesensor2= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_B_middle')
            temperaturesensor3= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_B_bottom')
        except:
            response = 'error: Temperature sensor not found'
    elif rack == "Network":
        try:
            temperaturesensor1= TemperatureSensor.objects.get(plc=plc, measuring_environment='Network')
            temperaturesensor2= TemperatureSensor.objects.get(plc=plc, measuring_environment='Network')
            temperaturesensor3= TemperatureSensor.objects.get(plc=plc, measuring_environment='Network')
        except:
            response = 'error: Temperature sensor not found'
    elif rack == "Energy":
        try:
            temperaturesensor1= TemperatureSensor.objects.get(plc=plc, measuring_environment='Energy')
            temperaturesensor2= TemperatureSensor.objects.get(plc=plc, measuring_environment='Energy')
            temperaturesensor3= TemperatureSensor.objects.get(plc=plc, measuring_environment='Energy')
        except:
            response = 'error: Temperature sensor not found'

    if temperaturesensor1 is not None and temperaturesensor2 is not None and temperaturesensor3 is not None:
        try:
            latest_value_obj1 = TemperatureSensorValue.objects.filter(temperaturesensor=temperaturesensor1, time__lte=current_time).latest('time')
            latest_value_obj2 = TemperatureSensorValue.objects.filter(temperaturesensor=temperaturesensor2, time__lte=current_time).latest('time')
            latest_value_obj3 = TemperatureSensorValue.objects.filter(temperaturesensor=temperaturesensor3, time__lte=current_time).latest('time')
        except:
            latest_value_obj1 = None
            latest_value_obj2 = None
            latest_value_obj3 = None
            
            
        if latest_value_obj1 is not None and latest_value_obj2 is not None and latest_value_obj3 is not None:
            sensor_value1 = latest_value_obj1.tempvalue
            sensor_value2 = latest_value_obj2.tempvalue
            sensor_value3 = latest_value_obj3.tempvalue
            sensor_validity1 = latest_value_obj1.valid
            sensor_validity2 = latest_value_obj2.valid
            sensor_validity3 = latest_value_obj3.valid
        else:
            response = "No data available."
            
        if type(sensor_value1)=="float" and type(sensor_value2)=="float" and type(sensor_value3)=="float":
            
            if sensor_validity1 and sensor_validity2 and sensor_validity3:
                if sensor_value1 < critical_value and sensor_value2 < critical_value and sensor_value3 < critical_value:
                    response="The door is safe to open."
                    access = True
            else:
                response= "Invalid sensor data."
        else:
            response="Wrong data type of the sensor values."
    else:
        return access, response



def Check_door_status(this_door):
    door_sensor = DoorSensor.objects.get(device_door = this_door)
    current_time = timezone.now()
    try:
        latest_data = DoorsensorValue.objects.filter(doorsensordevice = door_sensor, time__lte=current_time).latest('time')
    except:
        latest_data = None
        
    if latest_data is not None:
        sensor_data = latest_data.value
        sensor_validity = latest_data.valid
    else:
        response = "No data available."
        
    if sensor_validity:
        if sensor_data == "closed":
            access= True
        elif sensor_data == "open":
            access= False
            response = "The door is already open "
        else:
            access=False
            response = "The data is not valid."
    else:
        response = "The sensor is faulted."
    return access, response