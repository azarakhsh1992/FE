from django.contrib import admin
from .mainmodels.cabinetlevel.cabinets import Cabinet
from .mainmodels.userrelated.users import UserProfile
from .mainmodels.cabinetlevel.doors import Door
from .mainmodels.equipment.temperaturesensordevice import TemperaturesensorDevice, TemperaturesensorValue
from .mainmodels.equipment.led import LedDevice
from .mainmodels.equipment.lock import Latch
from .mainmodels.modules.plc import PLC
from .mainmodels.equipment.doorsensor import DoorSensor
from .mainmodels.equipment.button import DoorButton
from .mainmodels.functionalities.json import Json_draft
from .mainmodels.userrelated.groupofshifts import GroupShift,ShiftOfGroup
from .mainmodels.equipment.devices import Device


# Register your models here.

# admin.site.register(User)
admin.site.register(PLC)

admin.site.register(TemperaturesensorDevice)
admin.site.register(Latch)
admin.site.register(LedDevice)

admin.site.register(DoorSensor)
admin.site.register(DoorButton)
admin.site.register(Device)
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

@admin.register(Cabinet)
class UserProfileAdmin(admin.ModelAdmin):
    fields =('bereich','segment','anlage','arg_sps','pultbereich_sk','station','funktionseinheit')
    list_display = ('id','bereich','segment','anlage','arg_sps','pultbereich_sk','station','funktionseinheit')

@admin.register(Door)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ('cabinet', 'rack', 'direction')
    list_display = ('id', 'cabinet', 'rack', 'direction', 'qr')