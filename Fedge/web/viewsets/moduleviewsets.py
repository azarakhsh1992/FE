from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response

from ..mainmodels.iolmodules.doorsensor import DoorsensorDevice
from ..mainmodels.iolmodules.temperaturesensordevice import TemperaturesensorValue,TemperaturesensorDevice
from ..serializers.moduleserializers import TempSensorDevSerializer,ContainerSerializer,TempSensorValSerializer
from ..serializers.serializers import DoorSensorSerializer


class ContainerViewset(viewsets.ModelViewSet):
    queryset = TemperaturesensorValue.objects.all()
    serializer_class = TempSensorValSerializer

    @action(methods=['POST'], detail=False)
    def setparams(self, request):
        serializer = ContainerSerializer(data=request.data)
        if serializer.is_valid():
            response = {'message': 'data recieved'}
            print(serializer.data.get('cabinet'))
            return Response(response, status=status.HTTP_200_OK)
        else:
            response = {'message': 'data not correct'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
class DoorSensorViewset(viewsets.ModelViewSet):
    queryset = DoorsensorDevice.objects.all()
    serializer_class = DoorSensorSerializer

