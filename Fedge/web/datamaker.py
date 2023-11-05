import random
from datetime import datetime
from apscheduler.jobstores.base import JobLookupError
from django_apscheduler.jobstores import DjangoJobStore, register_events, register_job
from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.triggers.interval import IntervalTrigger

from .mainmodels.cabinetlevel.cabinets import Cabinet
from .mainmodels.iolmodules.doorsensor import DoorsensorDevice, DoorsensorValue
from .mainmodels.iolmodules.led import LedDevice, LedValue
from .mainmodels.iolmodules.lock import LockactuatorDevice, LockactuatorValue
from .mainmodels.iolmodules.temperaturesensordevice import TemperaturesensorDevice, TemperaturesensorValue
from .mainmodels.modules.plc import PLC

scheduler = BackgroundScheduler()
scheduler.add_jobstore(DjangoJobStore(), "default")


def generate_random_float(start, end):
    random_float = round(random.uniform(start, end), 1)
    return random_float


@register_job(scheduler, IntervalTrigger(seconds=10), id='my_function', replace_existing=True)
def my_function():
    _datetime = datetime.now()
    cabinet = Cabinet.objects.get(profinet_name="K11111111111111")
    plc = PLC.objects.get(cabinet=cabinet)
    # door sensor
    doorsensor = DoorsensorDevice.objects.get(plc=plc)
    doorsensorvalue = DoorsensorValue.objects.create(doorsensordevice=doorsensor, value=True, timestamp=_datetime)
    # led device
    leddevice = LedDevice.objects.get(plc=plc)
    leddevicevalue = LedValue.objects.create(leddevice=leddevice, value=True, timestamp=_datetime)
    # lock actuator
    lockactuator = LockactuatorDevice.objects.get(plc=plc)
    lockactuatorvalue = LockactuatorValue.objects.create(lockactuatordevice=lockactuator, value=True, timestamp=_datetime)
    # tempsensor
    tempsensor = TemperaturesensorDevice.objects.get(plc=plc)
    tempsensorvalue = TemperaturesensorValue.objects.create(temperaturesensordevice=tempsensor, tempvalue=generate_random_float(24.5, 55.5), humidvalue=generate_random_float(20, 50), timestamp=_datetime)
    print(plc)
    # print('successfully created')
