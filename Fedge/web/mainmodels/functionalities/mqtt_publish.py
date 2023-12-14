import paho.mqtt.client as mqtt
from ..equipment.plc import PLC
from ..equipment.devices import Device
from ..equipment.latch import Latch
from ..equipment.led import LED
from django.utils import timezone


def send_mqtt_latch(latch,value,delay,delayed_value):
    broker="192.168.1.1"
    profinet_name=''
    topic =''
    latch_value=''
    message=''
    sent= False
    current_time= timezone.now()
    try:
        latch = Latch.objects.get(pk=latch.pk)
        profinet_name = latch.profinet_name
        plc_profinet_name = latch.plc.profinet_name
        topic = plc_profinet_name
    except:
        response= "Latch not found"
        
    message= f"LATCH;{profinet_name};D;{delay};{value};{delayed_value};{current_time}".replace("True","TRUE").replace("False","FALSE")
    try:
        client = mqtt.Client()
        client.connect(broker, 1883, 60)  # Replace with your MQTT broker address
        client.publish(topic, message)
        client.disconnect()    
        response= "Message sent to MQTT broker successfully"
        sent = True
    except:
        response= "Cannot connect to MQTT broker"
    try:
        client = mqtt.Client()
        client.connect(broker, 1883, 60)  # Replace with your MQTT broker address
        client.publish(topic, message)
        client.disconnect()
        response= "Message sent to MQTT broker successfully"
        sent = True
    except:
        response= "Cannot connect to MQTT broker"
    return sent, response

def send_mqtt_led(led,value,delay,delayed_value):
    broker="192.168.1.1"
    profinet_name=''
    topic =''
    message=''
    sent= False
    current_time= timezone.now()

    try:
        led = LED.objects.get(pk=led.pk)
        profinet_name = led.profinet_name
        plc_profinet_name = led.plc.profinet_name
        topic = plc_profinet_name
    except:
        response= "LED not found"

    message= f"LED;{profinet_name};D;{delay};{value};{delayed_value};{current_time}"
    try:
        client = mqtt.Client()
        client.connect(broker, 1883, 60)  # Replace with your MQTT broker address
        client.publish(topic, message)
        client.disconnect()    
        response= "Message sent to MQTT broker successfully"
        sent=True
    except:
        response= "Cannot connect to MQTT broker"
    
    return sent, response
