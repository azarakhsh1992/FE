from rest_framework import viewsets
from rest_framework.decorators import action

from web.mainmodels.cabinetlevel.cabinets import Cabinet
from web.mainmodels.cabinetlevel.doors import Door
from web.serializers.cabinetanddoor import CabinetSerializer, DoorSerializer


class CabinetViewset(viewsets.ModelViewSet):
    queryset = Cabinet.objects.all()
    serializer_class = CabinetSerializer

    # authentication_classes = [TokenAuthentication]
    # permission_classes = [AllowAny]
    # @action(methods=['POST'], detail=False)
    # def checkTemp(self, request, qr):
    #     door = Door.objects.get(qr=qr)
    #     cabinet = Cabinet.objects.get(door=door)
    #     iolink = Iolink.objects.get(cabinet=cabinet)
    #     value = TemperaturesensorDevice.objects.get(iolink=iolink).value_temperature
    #     return Response({'temp': value}, status.HTTP_200_OK)

    @action(methods=['POST'], detail=False)
    def checkEnergy():
        pass

    @action(methods=['POST'], detail=False)
    def checkDoorSensor():
        pass

    @action(methods=['POST'], detail=False)
    def checkActuator():
        pass

    @action(methods=['POST'], detail=False)
    def checkLed():
        pass

    @action(methods=['POST'], detail=False)
    def checkButton():
        pass

    @action(methods=['POST'], detail=False)
    def checkLock():
        pass


class DoorViewset(viewsets.ModelViewSet):
    queryset = Door.objects.all()
    serializer_class = DoorSerializer