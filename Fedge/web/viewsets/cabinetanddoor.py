from rest_framework import viewsets
from rest_framework.decorators import action

from web.mainmodels.cabinetlevel.cabinets import Cabinet
from web.mainmodels.cabinetlevel.doors import Door
from web.serializers.cabinetanddoor import CabinetSerializer, DoorSerializer


class CabinetViewset(viewsets.ModelViewSet):
    queryset = Cabinet.objects.all()
    serializer_class = CabinetSerializer

    # @action(methods=['POST'],detail=False)
    # def
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