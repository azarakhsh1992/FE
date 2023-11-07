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


class ContainerSerializer(serializers.Serializer):
    cabinet = serializers.CharField()
    temp = serializers.DictField(child=serializers.CharField())
    doorbutton = serializers.DictField(child=serializers.CharField())
    doorsensor = serializers.DictField(child=serializers.CharField())
    led = serializers.DictField(child=serializers.CharField())
    lockactuator = serializers.DictField(child=serializers.CharField())
    locksensor = serializers.DictField(child=serializers.CharField())
    aircondition = serializers.DictField(child=serializers.CharField())
    energy = serializers.DictField(child=serializers.CharField())
    time = serializers.DateTimeField()
    def create(self, validated_data):
        pass
    def update(self, instance, validated_data):
        pass

# ///////////// Button Serializer ////////////////

class ButtonSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoorButton
        fields = ('port', 'module_type', 'bmk', 'serial_number', 'manufacturer', 'value', 'plc')


# ///////// Cabinet Serializer /////////////////////

# ///////// Door_Sensor Serializer /////////////
class DoorSensorSerializer(serializers.ModelSerializer):
    class Meta:
        model = DoorSensor
        fields = "__all__"