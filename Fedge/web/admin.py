from django.contrib import admin
from .mainmodels.cabinetlevel.cabinets import Cabinet, Rack
from .mainmodels.userrelated.users import UserProfile
from .mainmodels.cabinetlevel.doors import Door
from .mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from .mainmodels.equipment.led import LED
from .mainmodels.equipment.latch import Latch
from .mainmodels.equipment.plc import PLC
from .mainmodels.equipment.doorsensor import DoorSensor
from .mainmodels.equipment.button import DoorButton
from .mainmodels.functionalities.json import Json_draft
from .mainmodels.userrelated.groupofshifts import GroupShift,ShiftOfGroup
from .mainmodels.equipment.devices import Device
from .mainmodels.equipment.modeltest import Test, Child, TestP


# Register your models here.

# admin.register(User)
@admin.register(TemperatureSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('id','profinet_name','plc','module_type')

@admin.register(DoorSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('id','profinet_name','plc','module_type','device_door')

@admin.register(DoorButton)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('id','profinet_name','plc')
    
@admin.register(Device)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('id','profinet_name','plc')
# admin.register(QR_code)
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

@admin.register(TestP)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('id','attrp3')

@admin.register(Test)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('attr1','attr2','attr3','attr4')
@admin.register(Child)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('attr1','attr2')

@admin.register(TemperatureSensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ('temperaturesensordevice', 'tempvalue','humidvalue','time')
    list_display = ('temperaturesensordevice', 'tempvalue','humidvalue','time')

@admin.register(LED)
class UserProfileAdmin(admin.ModelAdmin):

    list_display = ('id','profinet_name','plc')

@admin.register(Cabinet)
class UserProfileAdmin(admin.ModelAdmin):
    fields =('bereich','segment','anlage','arg_sps','pultbereich_sk','station')
    list_display = ('id','bereich','segment','anlage','arg_sps','pultbereich_sk','station')

@admin.register(Latch)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('id','profinet_name')

@admin.register(Door)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ('cabinet', 'rack', 'direction')
    list_display = ('id', 'cabinet', 'rack', 'direction', 'qr')
    
@admin.register(Rack)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('cabinet','name','id')
    
@admin.register(PLC)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('id', 'cabinet','profinet_name')