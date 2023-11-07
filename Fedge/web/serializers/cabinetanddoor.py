from ..mainmodels.cabinetlevel.cabinets import Cabinet
from rest_framework import serializers

from ..mainmodels.cabinetlevel.doors import Door


class CabinetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cabinet
        fields = "__all__"
class FullCabinetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cabinet
        fields = ('__all__')


class DoorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Door
        fields = "__all__"

class FullDoorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Door
        fields = ('__all__')