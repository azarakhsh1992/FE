from rest_framework import serializers
from .users import User
from .iolink import Io_link
from .cabinets import Cabinet
from .doors import Door
from .energy_module import Energy_sensor
from .led import Led
from .Ports import Ports
from .temperature_sensor import Temperature_sensor


class UserSerializer(serializers.ModelSerializer):
    
    class Meta:
        pass

class iolinkSerializer(serializers.ModelSerializer):
	class Meta:
		pass


class cabinetSerializer(serializers.ModelSerializer):
	class Meta:
		# model = Cabinet
		# fields = ('name', 'profinet_name', 'location', 'segment')
		pass