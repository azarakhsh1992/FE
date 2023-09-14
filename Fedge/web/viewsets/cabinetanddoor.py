from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from ..mainmodels.cabinetlevel.cabinets import Cabinet
from ..mainmodels.cabinetlevel.doors import Door
from ..serializers.cabinetanddoor import CabinetSerializer, DoorSerializer


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

    @action(methods=['POST'],detail=False)
    def getdoor(self,request):
        qrin = request.data['qr']
        print(qrin)
        try:
            door = Door.objects.get(qr=qrin)
            print('DoorFound')
            response = {'message': 'Door Found'}
            return Response(response, status=status.HTTP_200_OK)
        except:
            response = {'message': 'Door not Found'}
            return Response(response, status=status.HTTP_400_BAD_REQUEST)