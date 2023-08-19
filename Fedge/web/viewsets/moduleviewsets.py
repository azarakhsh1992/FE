from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response

from web.mainmodels.iolmodules.doorsensor import DoorsensorDevice
from web.mainmodels.iolmodules.temperaturesensordevice import TemperaturesensorValue,TemperaturesensorDevice
from web.serializers.moduleserializers import TempSensorDevSerializer,ContainerSerializer,TempSensorValSerializer
from web.serializers.serializers import DoorSensorSerializer


class ContainerViewset(viewsets.ModelViewSet):
    queryset = TemperaturesensorValue.objects.all()
    serializer_class = TempSensorValSerializer

    @action(methods=['POST'], detail=True, serializer_class=ContainerSerializer)
    def setparams(self, request, pk):
        tempdevice = TemperaturesensorDevice.objects.get(pk=pk)
        serializer = ContainerSerializer(data=request.data)
        if serializer.is_valid():
            print(serializer.data)
            # try to insert value
            # try:
            #     tempval = TemperaturesensorValue.objects.get(temperaturesensordevice=tempdevice)
            #     tempval.tempvalue = serializer.data.get('tempvalue')
            #     tempval.humidvalue = serializer.data.get('humidvalue')
            #     tempval.timestamp = serializer.data.get('timestamp')
            #     tempval.save()
            #     response = {'message': 'values inserted'}
            #     return Response(response,status=status.HTTP_200_OK)
            # # except to create value model first
            # except:
            tempval = TemperaturesensorValue.objects.create(temperaturesensordevice=tempdevice, tempvalue=serializer.data.get('tempvalue'),\
                                                                humidvalue=serializer.data.get('humidvalue'),timestamp=serializer.data.get('timestamp'))
            response = {'message': 'value inserted'}
            return Response(response, status=status.HTTP_200_OK)
        else:
            response = {'message': serializer.error_messages}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
class DoorSensorViewset(viewsets.ModelViewSet):
    queryset = DoorsensorDevice.objects.all()
    serializer_class = DoorSensorSerializer

