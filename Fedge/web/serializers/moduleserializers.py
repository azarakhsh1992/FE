from rest_framework import serializers

from ..mainmodels.equipment.temperaturesensordevice import TemperatureSensorValue,TemperatureSensor
from ..mainmodels.equipment.button import DoorButton
from ..mainmodels.equipment.doorsensor import DoorSensor

class TempSensorDevSerializer(serializers.ModelSerializer):
    class Meta:
        model = TemperatureSensor
        fields = '__all__'


class TempSensorValSerializer(serializers.ModelSerializer):
    class Meta:
        model = TemperatureSensorValue
        fields = "__all__"

# ///////////// Button Serializer ////////////////

class ButtonSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoorButton
        fields = "__all__"


# ///////// Cabinet Serializer /////////////////////

# ///////// Door_Sensor Serializer /////////////
class DoorSensorSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoorSensor
        fields = "__all__"