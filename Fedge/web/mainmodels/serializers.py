from rest_framework import serializers
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token
from .users import UserProfile
from .button import Button
from .cabinets import Cabinet
from .door_sensor import Door_sensor
from .json import Json_draft

class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ('id','firstname', 'lastname','accessable_cabinets', 'role', 'bereich', 'telephone', 'shift')


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