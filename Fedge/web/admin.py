from django.contrib import admin
from .mainmodels.cabinetlevel.cabinets import Cabinet, Rack
from .mainmodels.userrelated.users import UserProfile
from .mainmodels.cabinetlevel.doors import Door
from .mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from .mainmodels.equipment.led import LED, LedValue
from .mainmodels.equipment.latch import Latch, LatchValue
from .mainmodels.equipment.plc import PLC
from .mainmodels.equipment.doorsensor import DoorSensor, DoorsensorValue
from .mainmodels.equipment.latchsensor import LatchSensor, LatchSensorValue
from .mainmodels.equipment.button import DoorButton, ButtonValue
from .mainmodels.userrelated.groupofshifts import EmployeeGroup,Shifts,ShiftAssignment
from .mainmodels.equipment.devices import Device
from .mainmodels.equipment.energymodule import EnergysensorDevice, EnergySensorValue



######################Cabinet level########################
@admin.register(Cabinet)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","bereich","segment","anlage","arg_sps","pultbereich_sk","station","profinet_name")
    fields = ("bereich","segment","anlage","arg_sps","pultbereich_sk","station")

@admin.register(Rack)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","name","cabinet")
    fields = ("name", "cabinet")

@admin.register(Door)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","direction","rack","qr")
    fields = ("direction", "rack")
########################PLC and Device Model########################
@admin.register(PLC)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","cabinet","module_type","funktionseinheit","ip_address","serial_number"
                    ,"mac_address","profinet_name")
    fields = ("cabinet", "funktionseinheit", "ip_address", "serial_number"
                    ,"mac_address")
@admin.register(Device)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","plc","bmk","geraet","serial_number","manufacturer","profinet_name"
                    ,"this_module_type","io_module","port")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer"
                    , "io_module", "port")
    
#################Devices#######################
@admin.register(TemperatureSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "this_module_type", "io_module", "port" , "module_type",
                    "measuring_env")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer",
              "io_module", "port" ,"measuring_env")

@admin.register(EnergysensorDevice)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "this_module_type", "io_module", "port" , "module_type" , "measuring_env")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer"
                    , "io_module", "port","measuring_env")


@admin.register(DoorSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "this_module_type", "io_module", "port", "module_type","door_direction",
                    "rack_name","device_door")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer",
                    "io_module", "port", "door_direction","rack_name")

@admin.register(DoorButton)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "this_module_type", "io_module", "port", "module_type","door_direction",
                    "rack_name","device_door")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer",
              "io_module", "port","door_direction","rack_name")
    
@admin.register(LED)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "this_module_type", "io_module", "port", "module_type", "door_direction",
                    "rack_name", "device_door")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer",
              "io_module", "port", "door_direction", "rack_name")

@admin.register(Latch)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "this_module_type", "io_module", "port", "module_type", "door_direction",
                    "rack_name", "device_door")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer",
              "io_module", "port", "door_direction", "rack_name")
    
@admin.register(LatchSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "this_module_type", "io_module", "port", "module_type", "door_direction",
                    "rack_name", "device_door")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer",
              "io_module", "port", "door_direction", "rack_name")
    
    
#######################Values#######################
@admin.register(LatchValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("time","latch","value","valid")
    fields = ("latch", "value", "valid")
    
@admin.register(LatchSensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("time","latchsensor","value","valid")
    fields = ("latchsensor", "value", "valid")
    
@admin.register(ButtonValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("time","doorbutton","value","valid")
    fields = ("doorbutton", "value", "valid")

@admin.register(DoorsensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("time", "doorsensordevice", "value", "valid")
    fields = ("doorsensordevice", "value", "valid")

@admin.register(LedValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("time", "led", "value", "valid")
    fields = ("led", "value", "valid")

@admin.register(TemperatureSensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("time","temperaturesensordevice","tempvalue","tempvalue_min","tempvalue_max"
                    ,"humidvalue","valid")
    fields = ("temperaturesensordevice", "tempvalue", "tempvalue_min", "tempvalue_max"
                    , "humidvalue", "valid")

@admin.register(EnergySensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("time","energysensordevice","energy_value","energy_unit","power_value",
                    "power_unit","valid")
    fields = ("energysensordevice", "energy_value", "energy_unit", "power_value",
                    "power_unit", "valid")

################################################################
@admin.register(EmployeeGroup)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","group")
    fields = ("group",)

@admin.register(Shifts)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","group","shift","date")
    fields = ("group", "shift", "date")



# @admin.register(UserProfile)
# class UserProfileAdmin(admin.ModelAdmin):
#     list_display = [field.name for field in UserProfile._meta.get_fields()]

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","user","firstname","lastname","role","bereich","telephone","employee_group")
    fields = ("user","firstname","lastname","role","bereich","telephone","employee_group")
