from rest_framework import serializers

from web.mainmodels.iolmodules.temperaturesensordevice import TemperaturesensorValue,TemperaturesensorDevice

class TempSensorDevSerializer(serializers.ModelSerializer):
    class Meta:
        model = TemperaturesensorDevice
        fields = '__all__'


class TempSensorValSerializer(serializers.ModelSerializer):
    class Meta:
        model = TemperaturesensorValue
        fields = ('temperaturesensordevice', 'tempvalue', 'humidvalue', 'timestamp')


class ContainerSerializer(serializers.Serializer):
    tempvalue= serializers.FloatField(required=True)
    humidvalue= serializers.FloatField(required=True)
    # btnval= serializers.BooleanField(required=True)
    # doorsenval= serializers.BooleanField(required=True)
    # ledval= serializers.BooleanField(required=True)
    # lockval= serializers.BooleanField(required=True)
    timestamp = serializers.DateTimeField(required=True)

