from django.contrib import admin
from  .mainmodels.cabinets import Cabinet
from  .mainmodels.users import User, Token
from  .mainmodels.doors import Door
from .mainmodels.Ports import Ports
from .mainmodels.temperature_sensor import Temperature_sensor
from .mainmodels.led import Led
from .mainmodels.lock import Lock_actuator
from .mainmodels.iolink import Io_link
from .mainmodels.door_sensor import Door_sensor
from .mainmodels.button import Button
from .mainmodels.json import Json_draft


# Register your models here.

# admin.site.register(User)
admin.site.register(Cabinet)
admin.site.register(Door)
admin.site.register(Io_link)

admin.site.register(Temperature_sensor)
admin.site.register(Lock_actuator)
admin.site.register(Led)
admin.site.register(Ports)
admin.site.register(Token)
admin.site.register(Door_sensor)
admin.site.register(Button)
admin.site.register(Json_draft)
# admin.site.register(QR_code)

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    # fields = ('name', 'email', 'password')
    list_display = ('email','full_name','password')
    