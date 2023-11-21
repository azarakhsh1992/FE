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
    list_display=["bereich","segment","anlage","arg_sps","pultbereich_sk","station","profinet_name"]
    # list_display = [field.name for field in Cabinet._meta.get_fields()] 

@admin.register(Rack)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["name","cabinet"] 

@admin.register(Door)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["rack", "direction","qr"] 
########################PLC and Device Model########################
@admin.register(PLC)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ['module_type','profinet_name','cabinet','funktionseinheit', 'geraet', 'bmk','ip_address','serial_number','mac_address',"manufacturer"]
    
@admin.register(Device)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["this_module_type","profinet_name","plc","io_module","port","geraet","bmk","serial_number","manufacturer"]
    
#################Devices#######################
@admin.register(TemperatureSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display =  ["profinet_name","plc","module_type","measuring_env","geraet","bmk","serial_number","manufacturer","io_module","port","rack"]
    # list_display =  [field.name for field in Device._meta.get_fields()]
    
@admin.register(EnergysensorDevice)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in EnergysensorDevice._meta.get_fields()] 

@admin.register(DoorSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DoorSensor._meta.get_fields()] 

@admin.register(DoorButton)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DoorButton._meta.get_fields()] 
    
@admin.register(LED)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in LED._meta.get_fields()] 

@admin.register(Latch)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["profinet_name","plc","rack_name","door_direction","module_type","device_door","geraet","bmk","serial_number","manufacturer","io_module","port","rack"] 
    
@admin.register(LatchSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in LatchSensor._meta.get_fields()] 
    
    
#######################Values#######################
@admin.register(LatchValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["latch","time","value","valid"] 
    
@admin.register(LatchSensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in LatchSensorValue._meta.get_fields()] 
    
@admin.register(ButtonValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in ButtonValue._meta.get_fields()] 

@admin.register(DoorsensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in DoorsensorValue._meta.get_fields()] 

@admin.register(LedValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in LedValue._meta.get_fields()] 


@admin.register(TemperatureSensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in TemperatureSensorValue._meta.get_fields()]  

@admin.register(EnergySensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in EnergySensorValue._meta.get_fields()]  

################################################################
@admin.register(EmployeeGroup)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["group"] 

@admin.register(Shifts)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["shift","shift_start","shift_end","shift_start_int","shift_end_int","extra_time_int","type"] 



@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = [field.name for field in UserProfile._meta.get_fields()]
    
@admin.register(ShiftAssignment)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["group","shift","starting_date","ending_date"] 