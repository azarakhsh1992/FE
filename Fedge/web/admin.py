from django.contrib import admin
from .mainmodels.cabinetlevel.cabinets import Cabinet
from .mainmodels.userrelated.users import UserProfile
from .mainmodels.cabinetlevel.doors import Door
from .mainmodels.iolmodules.temperaturesensordevice import TemperaturesensorDevice, TemperaturesensorValue
from .mainmodels.iolmodules.led import LedDevice
from .mainmodels.iolmodules.lock import LockactuatorDevice
from .mainmodels.modules.iolink import Iolink
from .mainmodels.iolmodules.doorsensor import DoorsensorDevice
from .mainmodels.iolmodules.button import ButtonDevice
from .mainmodels.functionalities.json import Json_draft
from .mainmodels.userrelated.groupofshifts import GroupShift,ShiftOfGroup
from .mainmodels.iolmodules.iolmodule import Iol_Module


# Register your models here.

# admin.site.register(User)
admin.site.register(Cabinet)
admin.site.register(Door)
admin.site.register(Iolink)

admin.site.register(TemperaturesensorDevice)
admin.site.register(LockactuatorDevice)
admin.site.register(LedDevice)

admin.site.register(DoorsensorDevice)
admin.site.register(ButtonDevice)
admin.site.register(Iol_Module)
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


@admin.register(TemperaturesensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ('temperaturesensordevice', 'tempvalue','humidvalue','timestamp')
    list_display = ('temperaturesensordevice', 'tempvalue','humidvalue','timestamp')