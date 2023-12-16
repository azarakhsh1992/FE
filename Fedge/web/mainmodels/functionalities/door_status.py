from django.db import models
from ..cabinetlevel.cabinets import Cabinet
from ..equipment.plc import PLC
from ..cabinetlevel.doors import Door
from ..equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from ..equipment.led import LED,LedValueCases 
from ..userrelated.users import User
from ..equipment.doorsensor import DoorSensor, DoorsensorValue
from django.utils import timezone

def is_safe(this_door):
    current_time = timezone.now()
    door = Door.objects.get(pk=this_door.pk)
    plc= PLC.objects.get(cabinet=door.rack.cabinet)
    rack = door.rack.name
    response = {}
    temperaturesensor1 = None
    temperaturesensor2 = None
    temperaturesensor3 = None
    access = False
    
    if rack == "Edge_A":
        try:
            temperaturesensor1= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_A_top')
            critical_value1 = temperaturesensor1.critical_value
            temperaturesensor2= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_A_middle')
            critical_value2 = temperaturesensor2.critical_value
            temperaturesensor3= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_A_bottom')
            critical_value3 = temperaturesensor3.critical_value
        except:
            response = {'Error_safety1': 'Temperature sensor not found'}
    elif rack == "Edge_B":
        try:
            temperaturesensor1= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_B_top')
            critical_value1 = temperaturesensor1.critical_value
            temperaturesensor2= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_B_middle')
            critical_value2 = temperaturesensor2.critical_value
            temperaturesensor3= TemperatureSensor.objects.get(plc=plc, measuring_environment='Edge_B_bottom')
            critical_value3 = temperaturesensor3.critical_value
        except:
            response = {'Error_safety1': 'Temperature sensor not found'}
    elif rack == "Network":
        try:
            temperaturesensor1= TemperatureSensor.objects.get(plc=plc, measuring_environment='Network')
            critical_value1 = temperaturesensor1.critical_value
            temperaturesensor2= temperaturesensor1
            critical_value2 = temperaturesensor2.critical_value
            temperaturesensor3= temperaturesensor1
            critical_value3 = temperaturesensor3.critical_value
        except:
            response = {'Error_safety1': 'Temperature sensor not found'}
    elif rack == "Energy":
        try:
            temperaturesensor1= TemperatureSensor.objects.get(plc=plc, measuring_environment='Energy')
            critical_value1 = temperaturesensor1.critical_value
            temperaturesensor2= temperaturesensor1
            critical_value2 = temperaturesensor2.critical_value
            temperaturesensor3= temperaturesensor1
            critical_value3 = temperaturesensor3.critical_value
        except:
            response = {'Error_safety1': 'Temperature sensor not found'}

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
            response = {"Error_safety2":"No Temperature sensor data available."}
            
        if type(sensor_value1)=="float" and type(sensor_value2)=="float" and type(sensor_value3)=="float":
            
            if sensor_validity1 and sensor_validity2 and sensor_validity3:
                if sensor_value1 < critical_value1 and sensor_value2 < critical_value2 and sensor_value3 < critical_value3:
                    response= {"message_safety1":"The door is safe to open."}
                    access = True
                else:
                    response= {"message_safety1":"The door is not safe to open."}
                    # this condition determines if the door should stay close when the temperature is above the critical value
                    access = True
                    # access = False
            else:
                response= {"Error_safety3":"Invalid sensor data."}
        else:
            response={"Error_safety4":"Wrong data type of the sensor values."}
    else:
        return access, response


def Check_door_status(door):
    current_time = timezone.now()
    access = False
    this_door= Door.objects.get(pk=door.pk)
    try:
        door_sensor = DoorSensor.objects.get(door=this_door)
    except:
        response = {"Error_ds1":"Door sensor not found"}
    try:
        latest_data = DoorsensorValue.objects.filter(doorsensor = door_sensor, time__lte=current_time).latest('time')
        if latest_data is not None:
            sensor_data = latest_data.value
            sensor_validity = latest_data.valid
        else:
            access=False
            response = {"Error_ds1":"Door sensor data not available."}
            
        if sensor_validity:
            if sensor_data == "closed":
                access= True
                response = {"Message_ds":"The door is closed and available to be opened"}
            elif sensor_data == "open":
                access= False
                response = {"Message_ds":"The door is already open"}
            else:
                access=False
                response = {"Error_ds2":"The door sensor data is not valid."}
        else:
            access=False
            response = {"Error_ds2":"The sensor is faulted."}
    except:
        latest_data = None
        response= {"Error_ds1":"Sensor value not found"}
    return access, response

def led_status_find(door):
    current_time=timezone.now()
    response ={}
    led_value = LedValueCases.objects.get(description="door_not_locked").value
    latest_data=None
    try:
        door_sensor = DoorSensor.objects.get(door=door)
        latest_data = DoorsensorValue.objects.filter(doorsensordevice=door_sensor, valid=True, time_lte=current_time).latest('time')
    except:
        response = {"Error_lf":"No sensor or valid sensor data found"}
    if latest_data is not None:
        value = latest_data.value
        if value == "closed":
            led_value = LedValueCases.objects.get(description="default").value
            response = {"Message_lf":"door is closed"}
        elif value == "open":
            led_value = LedValueCases.objects.get(description="default_open").value
            response = {"Message_lf":"door is open"}
    else:
        response = {"Error_lf":"No data available to find the signal lamp"}
    print(led_value,response)
    return led_value