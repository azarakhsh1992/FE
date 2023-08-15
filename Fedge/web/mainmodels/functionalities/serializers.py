from rest_framework import serializers
from rest_framework.authtoken.models import Token
from ..userrelated.users import User, UserProfile
from ..modules.iolink import Io_link
from ..cabinetlevel.cabinets import Cabinet
from ..cabinetlevel.doors import Door
from ..modules.energy_module import Energy_sensor
from ..iolmodules.led import Led
from ..iolmodules.temperature_sensor import Temperature_sensor
from ..iolmodules.button import Button
from ..iolmodules.door_sensor import Door_sensor
from .json import Json_draft
from ..userrelated.groupofshifts import GroupShift,ShiftOfGroup

class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ('id','firstname', 'lastname','accessable_cabinets', 'role', 'bereich', 'telephone', 'group')


class UserSerializer(serializers.ModelSerializer):
    profile = UserProfileSerializer()

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'profile')


    def create(self, validated_data):
        profile_data = validated_data.pop('profile')
        password = validated_data.pop('password')
        user = User.objects.create_user(**validated_data)
        UserProfile.objects.create(user=user, **profile_data)
        Token.objects.create(user=user)
        user.set_password(password)
        user.save()
        return User

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        if 'request' in self.context and self.context['request'].method == 'POST':
            ret.pop('password','')
            ret.pop
        return ret
# ///////////// Button Serializer ////////////////

class ButtonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Button
        fields = ('port', 'module_type', 'bmk', 'serial_number', 'manufacturer', 'value', 'iolink')

# ///////// Cabinet Serializer /////////////////////
class CabinetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cabinet
        fields = ('bereich', 'segment', 'anlage', 'arg_sps', 'pultbereich_sk', 'station', 'funktionseinheit')
# ///////// Door_Sensor Serializer /////////////
class DoorSensorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Door_sensor
        fields = ('module_type', 'bmk', 'serial_number', 'manufacturer', 'value', 'iolink')
        
        
class Jsonserializer(serializers.ModelSerializer):
    class Meta:
        model = Json_draft
        fields = ('name', 'code', 'cid', 'adr')
        
    def to_representation(self, instance):
        ret = super().to_representation(instance)
        if 'request' in self.context and self.context['request'].method == 'POST':
            ret.pop('name', None)
        return ret

class CommandSerializer(serializers.ModelSerializer):
    sensor = serializers.CharField(required=True)
    command = serializers.CharField(required=True)

class ShiftOfGroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShiftOfGroup
        fields = ('group','shift','date')

class FullGroupShiftSerializer(serializers.ModelSerializer):
    groupshift = ShiftOfGroupSerializer(many=True)
    class Meta:
        model = GroupShift
        fields = ('group','groupshift')