from django.utils import timezone
from ..mainmodels.equipment.plc import PLC
from ..mainmodels.cabinetlevel.doors import Door
from ..mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue


def converter(self):
    qrcode = 'f0bdd98f5e7c4c6eb678'
    try:
        this_door = Door.objects.get(qr=qrcode)
        this_plc = PLC.objects.get(cabinet=this_door.rack.cabinet)
        temperature_sensors = TemperatureSensor.objects.filter(plc=this_plc)
        current_time = timezone.now()
        payload_temp = {}

        for i in temperature_sensors:
            start_time = current_time - timezone.timedelta(hours=24)
            qs = TemperatureSensorValue.objects.filter(temperaturesensor=i, valid=True, time__lte=current_time)
            if qs.exists():
                latest_value_temperature = qs.latest("time")
                payload_temp.update({
                    i.measuring_environment:
                        {
                            "Time": latest_value_temperature.time,
                            "Current": latest_value_temperature.tempvalue,
                            "Max": latest_value_temperature.tempvalue_max,
                            "Min": latest_value_temperature.humidvalue,
                            "Validity": latest_value_temperature.valid
                        }
                })
                print(payload_temp)
            else:
                print(f"No data for temperature sensor {i}")
    except:
        pass

converter