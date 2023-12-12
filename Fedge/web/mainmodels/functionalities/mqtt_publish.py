import paho.mqtt.client as mqtt
from ..equipment.plc import PLC
from ..equipment.devices import Device
from ..equipment.latch import Latch
from ..equipment.led import LED


def send_mqtt_latch(latch,value,delay,delay_value):
    broker="192.168.1.1"
    profinet_name=''
    topic =''
    latch_value=''
    message=''
    sent= False
    try:
        latch = Latch.objects.get(pk=latch.pk)
        profinet_name = latch.profinet_name
        plc_profinet_name = latch.plc.profinet_name
        topic = plc_profinet_name
    except:
        response= "Latch not found"
    if delay:
        message = "LATCH;"+profinet_name+';D;T;%i;%i'%value %delay_value
    else:
        message = "LATCH;"+profinet_name+';D;F;%i;%i'%value %delay_value
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
    topic =''
    message=''
    sent= False

    try:
        led = LED.objects.get(pk=led.pk)
        profinet_name = led.profinet_name
        plc_profinet_name = led.plc.profinet_name
        topic = plc_profinet_name
    except:
        response= "LED not found"
    if delay:
        message = "LED;"+profinet_name+';D;T;%i;%i'%value %delay_value
    else:
        message = "LED;"+profinet_name+';D;F;%i;%i'%value %delay_value
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
