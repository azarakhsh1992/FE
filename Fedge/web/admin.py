from django.contrib import admin
from  .mainmodels.cabinets import Cabinet
from  .mainmodels.users import User
from  .mainmodels.doors import Door
from .mainmodels.Ports import Ports
from .mainmodels.temperature_sensor import Temperature_sensor
from .mainmodels.led import Led
from .mainmodels.lock import Lock_actuator
from .mainmodels.iolink import Io_link
from .mainmodels.functions import Access_Checker


# Register your models here.

admin.site.register(User)
admin.site.register(Cabinet)
admin.site.register(Door)
admin.site.register(Io_link)

admin.site.register(Temperature_sensor)
admin.site.register(Lock_actuator)
admin.site.register(Led)
admin.site.register(Ports)
admin.site.register(Access_Checker)