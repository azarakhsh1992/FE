from django.contrib import admin
from .mainmodels.cabinets import Cabinet
from .mainmodels.users import UserProfile
from .mainmodels.doors import Door
from .mainmodels.Ports import Ports
from .mainmodels.temperature_sensor import Temperature_sensor
from .mainmodels.led import Led
from .mainmodels.lock import Lock_actuator
from .mainmodels.iolink import Io_link
from .mainmodels.door_sensor import Door_sensor
from .mainmodels.button import Button
from .mainmodels.json import Json_draft
from .mainmodels.groupofshifts import GroupShift,ShiftOfGroup


# Register your models here.

# admin.site.register(User)
admin.site.register(Cabinet)
admin.site.register(Door)
admin.site.register(Io_link)
admin.site.register(Temperature_sensor)
admin.site.register(Lock_actuator)
admin.site.register(Led)
admin.site.register(Ports)
admin.site.register(Door_sensor)
admin.site.register(Button)
# admin.site.register(QR_code)
@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ('user', 'accessable_cabinets' , 'role', 'bereich', 'telephone', 'group')
    list_display = ('id','accessable_cabinets' , 'role', 'bereich', 'telephone', 'group')

@admin.register(Json_draft)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ('name', 'code' , 'cid', 'adr', 'url', 'data', 'sensor', 'command')
    list_display = ('name', 'code' , 'cid', 'adr', 'url', 'data', 'sensor', 'command')


@admin.register(GroupShift)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ('group',)
    list_display = ('group',)

@admin.register(ShiftOfGroup)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ('group','shift','date')
    list_display = ('group','shift','date')