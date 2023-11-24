from rest_framework import serializers
from rest_framework.authtoken.models import Token

from ..mainmodels.cabinetlevel.cabinets import Cabinet

from ..mainmodels.userrelated.groupofshifts import EmployeeGroup, Shifts
from ..mainmodels.userrelated.users import User, UserProfile


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ('id', 'user', 'firstname', 'lastname', 'role', 'bereich', 'telephone', 'employee_group')


class UserSerializer(serializers.ModelSerializer):
    # profile = UserProfileSerializer()

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password')
        extra_kwargs = {
            'password': {'write_only': True},
        }

    def create(self, validated_data):
        # profile_data = validated_data.pop('profile')
        password = validated_data.pop('password')
        user = User.objects.create_user(**validated_data)
        # UserProfile.objects.create(user=user, **profile_data)
        Token.objects.create(user=user)
        user.set_password(password)
        user.save()
        return user

    # def to_representation(self, instance):
    #     ret = super().to_representation(instance)
    #     if 'request' in self.context and self.context['request'].method == 'POST':
    #         ret.pop('password', '')
    #     return ret






class CommandSerializer(serializers.ModelSerializer):
    sensor = serializers.CharField(required=True)
    command = serializers.CharField(required=True)


class ShiftSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shifts
        fields = ('group', 'shift', 'date')


class FullGroupShiftSerializer(serializers.ModelSerializer):
    users = serializers.SerializerMethodField()

    class Meta:
        model = EmployeeGroup
        fields = ('group', 'employeegroup', 'usergroup', 'users')

    def get_users(self, obj):
        users = UserProfile.objects.filter(group=obj)
        serializer = UserProfileSerializer(users, many=True)
        serialized_data = serializer.data
        firstnames = [user.get('firstname') for user in serialized_data]
        return firstnames
#TODO: this serializers must be modified


# from rest_framework import serializers
# from .models import DoorSensor

# class DoorSensorSerializer(serializers.ModelSerializer):
#     door_direction_choices = serializers.SerializerMethodField()
#     device_io_module_choices = serializers.SerializerMethodField()
#     device_port_choices = serializers.SerializerMethodField()

#     class Meta:
#         model = DoorSensor
#         fields = ['door_direction', 'device_io_module', 'device_port', 
#                   'door_direction_choices', 'device_io_module_choices', 
#                   'device_port_choices']

#     def get_door_direction_choices(self, obj):
#         return DoorSensor.DoorDirection.choices

#     def get_device_io_module_choices(self, obj):
#         return DoorSensor.IO_Module.choices

#     def get_device_port_choices(self, obj):
#         return DoorSensor.Port.choices
