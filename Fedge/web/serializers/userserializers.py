from rest_framework import serializers
from ..mainmodels.userrelated.users import UserLog

class UserlogSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserLog
        fields='__all__'