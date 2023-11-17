import paho.mqtt.client as mqtt
from ..equipment.plc import PLC
from ..equipment.devices import Device
from ..equipment.latch import Latch
from ..equipment.led import LED


def send_mqtt_latch(latch,value):
    broker="192.168.1.1"
    profinet_name=''
    sent= False
    message=''
    try:
        profinet_name = Latch.objects.get(pk=latch.pk).profinet_name
        plc = Latch.objects.get(pk=latch.pk).plc.profinet_name
    except:
        response= "Latch not found"
    message = profinet_name+':%s'%value
    try:
        client = mqtt.Client()
        client.connect(broker, 1883, 60)  # Replace with your MQTT broker address
        client.publish("plc", message)
        client.disconnect()    
        response= "Message sent to MQTT broker successfully"
        sent = True
    except:
        response= "Cannot connect to MQTT broker"
    return sent, response

def send_mqtt_led(led,value):
    broker="192.168.1.1"
    profinet_name=''
    sent= False
    message=''
    try:
        profinet_name = Latch.objects.get(pk=led.pk).profinet_name
        plc = Latch.objects.get(pk=led.pk).plc.profinet_name
    except:
        response= "Latch not found"
    message = profinet_name+':%s'%value
    try:
        client = mqtt.Client()
        client.connect(broker, 1883, 60)  # Replace with your MQTT broker address
        client.publish("plc", message)
        client.disconnect()    
        response= "Message sent to MQTT broker successfully"
        sent=True
    except:
        response= "Cannot connect to MQTT broker"
    
    return sent, response
