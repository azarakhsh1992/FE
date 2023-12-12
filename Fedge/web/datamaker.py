import random
from apscheduler.jobstores.base import JobLookupError
from django_apscheduler.jobstores import DjangoJobStore, register_events, register_job
from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.triggers.interval import IntervalTrigger

from .mainmodels.cabinetlevel.cabinets import Cabinet
from .mainmodels.equipment.doorsensor import DoorSensor, DoorsensorValue
from .mainmodels.equipment.led import LED, LedValue
from .mainmodels.equipment.latch import Latch, LatchValue
from .mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from .mainmodels.equipment.plc import PLC
from django.utils import timezone

scheduler = BackgroundScheduler()
scheduler.add_jobstore(DjangoJobStore(), "default")


def generate_random_float(start, end):
    random_float = round(random.uniform(start, end), 1)
    return random_float


@register_job(scheduler, IntervalTrigger(seconds=10), id='my_function', replace_existing=True)
def my_function():
    _datetime = timezone.now()
    cabinet = Cabinet.objects.get(profinet_name="K11111111111111")
    plc = PLC.objects.get(cabinet=cabinet)
    # door sensor
    doorsensor = DoorSensor.objects.get(plc=plc)
    doorsensorvalue = DoorsensorValue.objects.create(doorsensordevice=doorsensor, value=True, timestamp=_datetime)
    # led device
    led = LED.objects.get(plc=plc)
    leddevicevalue = LedValue.objects.create(led=led, value=True, timestamp=_datetime)
    # latch actuator
    lockactuator = Latch.objects.get(plc=plc)
    latchvalue = LatchValue.objects.create(latch=lockactuator, value=True, timestamp=_datetime)
    # tempsensor
    tempsensor = TemperatureSensor.objects.get(plc=plc)
    tempsensorvalue = TemperatureSensorValue.objects.create(temperaturesensor=tempsensor, tempvalue=generate_random_float(24.5, 55.5), humidvalue=generate_random_float(20, 50), timestamp=_datetime)
    print(plc)
    # print('successfully created')
