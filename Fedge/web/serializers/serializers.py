from rest_framework import serializers
from rest_framework.authtoken.models import Token

from ..mainmodels.cabinetlevel.cabinets import Cabinet
from ..mainmodels.functionalities.json import Json_draft

from ..mainmodels.userrelated.groupofshifts import GroupShift, ShiftOfGroup
from ..mainmodels.userrelated.users import User, UserProfile


class UserProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserProfile
        fields = ('id', 'user', 'firstname', 'lastname', 'accessable_cabinets', 'role', 'bereich', 'telephone', 'group')


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
        fields = ('group', 'shift', 'date')


class FullGroupShiftSerializer(serializers.ModelSerializer):
    users = serializers.SerializerMethodField()

    class Meta:
        model = GroupShift
        fields = ('group', 'groupshift', 'usergroup', 'users')

    def get_users(self, obj):
        users = UserProfile.objects.filter(group=obj)
        serializer = UserProfileSerializer(users, many=True)
        serialized_data = serializer.data
        firstnames = [user.get('firstname') for user in serialized_data]
        return firstnames
