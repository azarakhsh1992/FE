import paho.mqtt.client as mqtt
from ..equipment.plc import PLC
from ..equipment.devices import Device
from ..equipment.latch import Latch
from ..equipment.led import LED


def send_mqtt_latch(latch,value):
    broker="192.168.1.1"
    profinet_name=''
    topic =''
    latch_value=''
    sent= False
    message=''
    if value == True:
        latch_value = "True"
    else:
        pass
    try:
        profinet_name = Latch.objects.get(pk=latch.pk).profinet_name
        plc_profinet_name = Latch.objects.get(pk=latch.pk).plc.profinet_name
        topic = plc_profinet_name
    except:
        response= "Latch not found"
    message = "LATCH;"+profinet_name+';%s'%latch_value
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

def send_mqtt_led(led,value,delay,delay_value):
    broker="192.168.1.1"
    profinet_name=''
    sent= False
    if delay:
        message = "LED;"+profinet_name+';D;T;%s;%s'%value %delay_value
    else:
        message = "LED;"+profinet_name+';D;F;%s;%s'%value %delay_value
        
    try:
        profinet_name = LED.objects.get(pk=led.pk).profinet_name
        plc_profinet_name = LED.objects.get(pk=led.pk).plc.profinet_name
        topic = plc_profinet_name
    except:
        response= "LED not found"

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
