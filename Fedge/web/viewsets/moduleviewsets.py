from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response

from ..mainmodels.equipment.doorsensor import DoorSensor
from ..mainmodels.equipment.temperaturesensordevice import TemperatureSensorValue,TemperatureSensor
from ..serializers.moduleserializers import TempSensorDevSerializer,ContainerSerializer,TempSensorValSerializer
from ..serializers.moduleserializers import DoorSensorSerializer


class ContainerViewset(viewsets.ModelViewSet):
    queryset = TemperatureSensorValue.objects.all()
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

    @action(methods=['POST'], detail=False)
    def gettemp(self, request):
        num = request.data['num']
        datas = TemperatureSensorValue.objects.order_by('-time')[:int(num)]
        datas = TempSensorValSerializer(datas, many=True)
        finaldata = datas.data
        return Response(finaldata, status=status.HTTP_200_OK)
class DoorSensorViewset(viewsets.ModelViewSet):
    queryset = DoorSensor.objects.all()
    serializer_class = DoorSensorSerializer

