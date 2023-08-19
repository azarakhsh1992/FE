from web.mainmodels.cabinetlevel.cabinets import Cabinet
from rest_framework import serializers

from web.mainmodels.cabinetlevel.doors import Door


class CabinetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cabinet
        fields = ('bereich', 'segment', 'anlage', 'arg_sps', 'pultbereich_sk', 'station', 'funktionseinheit')


class DoorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Door
        fields = ('__all__')
