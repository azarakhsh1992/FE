from django.contrib import admin
from .mainmodels.cabinetlevel.cabinets import Cabinet, Rack
from .mainmodels.userrelated.users import UserProfile
from .mainmodels.cabinetlevel.doors import Door
from .mainmodels.equipment.temperaturesensordevice import TemperatureSensor, TemperatureSensorValue
from .mainmodels.equipment.led import LED, LedValue, LedValueCases
from .mainmodels.equipment.latch import Latch, LatchValue
from .mainmodels.equipment.plc import PLC
from .mainmodels.equipment.doorsensor import DoorSensor, DoorsensorValue
from .mainmodels.equipment.latchsensor import LatchSensor, LatchSensorValue
from .mainmodels.equipment.button import DoorButton, ButtonValue
from .mainmodels.userrelated.groupofshifts import EmployeeGroup,Shifts, ShiftAssignment
from .mainmodels.equipment.devices import Device
from .mainmodels.equipment.energymodule import EnergySensor, EnergySensorValue
from .mainmodels.requests.requests import Request
from .mainmodels.userrelated.users import UserLog
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
    list_display = ("id","cabinet","module_type","funktionseinheit","geraet","bmk"
                    ,"ip_address","serial_number", "mac_address","manufacturer","profinet_name")
    fields = ("cabinet","funktionseinheit","geraet","bmk"
                    ,"ip_address","serial_number", "mac_address","manufacturer")
@admin.register(Device)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","rack","profinet_name","module_type","io_module","port","plc","bmk","geraet","serial_number","manufacturer")
    # fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer", "port","rack")
    readonly_fields = list_display

#################Devices#######################
@admin.register(TemperatureSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "module_type", "io_module", "port",
                    "measuring_environment","rack","get_latest_validity","critical_value")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer", "device_io_module", "device_port" ,"measuring_environment","rack","critical_value")
    def get_latest_validity(self, obj):
        try:
            latest_value = TemperatureSensorValue.objects.filter(temperaturesensor=obj).latest('time')
            return latest_value.valid
        except TemperatureSensorValue.DoesNotExist:
            return "No Data"
    get_latest_validity.short_description = "Latest Data Validity"

@admin.register(EnergySensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "module_type", "io_module", "port" , "module_type",
                    "measuring_environment","rack","get_latest_validity")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer" ,"measuring_environment","rack")
    def get_latest_validity(self, obj):
        try:
            latest_value = EnergySensorValue.objects.filter(energysensor=obj).latest('time')
            return latest_value.valid
        except EnergySensorValue.DoesNotExist:
            return "No Data"
    get_latest_validity.short_description = "Latest Data Validity"

@admin.register(DoorSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "module_type", "device_io_module", "device_port", "module_type", "door_direction","rack", "door","get_latest_validity")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer","door_direction","rack","device_io_module", "device_port")
    def get_latest_validity(self, obj):
        try:
            latest_value = DoorsensorValue.objects.filter(doorsensor=obj).latest('time')
            return latest_value.valid
        except DoorsensorValue.DoesNotExist:
            return "No Data"
    get_latest_validity.short_description = "Latest Data Validity"
    
    

@admin.register(DoorButton)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "module_type", "device_io_module", "device_port", "module_type", "door_direction","rack", "door","get_latest_validity")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer","door_direction","rack","device_io_module", "device_port")
    def get_latest_validity(self, obj):
        try:
            latest_value = ButtonValue.objects.filter(doorbutton=obj).latest('time')
            return latest_value.valid
        except ButtonValue.DoesNotExist:
            return "No Data"
    get_latest_validity.short_description = "Latest Data Validity"

@admin.register(LED)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "module_type", "device_io_module", "device_port", "module_type", "door_direction","rack", "door","get_latest_validity")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer","door_direction","rack","device_io_module", "device_port")
    def get_latest_validity(self, obj):
        try:
            latest_value = LedValue.objects.filter(led=obj).latest('time')
            return latest_value.valid
        except LedValue.DoesNotExist:
            return "No Data"
    get_latest_validity.short_description = "Latest Data Validity"
    
@admin.register(Latch)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name"
                    , "module_type", "device_io_module", "device_port", "module_type", "door_direction","rack", "door","get_latest_validity")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer","door_direction","rack","device_io_module", "device_port")
    def get_latest_validity(self, obj):
        try:
            latest_value = LatchValue.objects.filter(latch=obj).latest('time')
            return latest_value.valid
        except LatchValue.DoesNotExist:
            return "No Data"
    get_latest_validity.short_description = "Latest Data Validity"


@admin.register(LatchSensor)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id", "plc", "bmk", "geraet", "serial_number", "manufacturer", "profinet_name", "module_type", "io_module", "port","rack","door")
    fields = ("plc", "bmk", "geraet", "serial_number", "manufacturer","door_direction","rack","device_io_module", "device_port")
    def get_latest_validity(self, obj):
        try:
            latest_value = LatchSensorValue.objects.filter(latchsensor=obj).latest('time')
            return latest_value.valid
        except LatchSensorValue.DoesNotExist:
            return "No Data"
    get_latest_validity.short_description = "Latest Data Validity"
    
    
#######################Values#######################
@admin.register(LatchValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("custom_time","latch","door","value","valid")
    fields = ("time","latch", "value", "valid")
    def custom_time(self, obj):
        return obj.time.strftime('%Y-%m-%d %H:%M:%S.%f')
    custom_time.short_description = "Date and Time"
    def door(self, obj):
        return obj.__str__()
    
@admin.register(LatchSensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("custom_time","latchsensor","door","value","valid")
    fields = ("time","latchsensor", "value", "valid")
    def custom_time(self, obj):
        return obj.time.strftime('%Y-%m-%d %H:%M:%S.%f')
    custom_time.short_description = "Date and Time"
    def door(self, obj):
        return obj.__str__()

@admin.register(ButtonValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("custom_time","doorbutton","door","value","valid")
    fields = ("time","doorbutton", "value", "valid")
    def custom_time(self, obj):
        return obj.time.strftime('%Y-%m-%d %H:%M:%S.%f')
    custom_time.short_description = "Date and Time"
    def door(self, obj):
        return obj.__str__()
    
@admin.register(DoorsensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("custom_time", "doorsensor","door", "value", "valid")
    fields = ("time","doorsensor", "value", "valid")
    def custom_time(self, obj):
        return obj.time.strftime('%Y-%m-%d %H:%M:%S.%f')
    custom_time.short_description = "Date and Time"
    def door(self, obj):
        return obj.__str__()

@admin.register(LedValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("custom_time", "led", "door","value", "valid")
    fields = ("time","led", "value", "valid")
    def custom_time(self, obj):
        return obj.time.strftime('%Y-%m-%d %H:%M:%S.%f')
    custom_time.short_description = "Date and Time"
    def door(self, obj):
        return obj.__str__()


@admin.register(TemperatureSensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("custom_time","temperaturesensor","rack","tempvalue","tempvalue_min","tempvalue_max"
                    ,"humidvalue","valid")
    fields = ("time","temperaturesensor", "tempvalue", "tempvalue_min", "tempvalue_max"
                    , "humidvalue", "valid")
    def custom_time(self, obj):
        return obj.time.strftime('%Y-%m-%d %H:%M:%S.%f')
    custom_time.short_description = "Date and Time"
    def rack(self, obj):
        return obj.__str__()

@admin.register(EnergySensorValue)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("custom_time","energysensor","rack","energy_value","energy_unit","power_value",
                    "power_unit","valid")
    fields = ("time","energysensor", "energy_value", "energy_unit", "power_value",
                    "power_unit", "valid")
    def custom_time(self, obj):
        return obj.time.strftime('%Y-%m-%d %H:%M:%S.%f')
    custom_time.short_description = "Date and Time"
    def rack(self, obj):
        return obj.__str__()
####################################Shift and User############################

@admin.register(Shifts)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","shift","shift_start", "shift_end", "extra_time_minute")
    fields = ("shift","shift_start", "shift_end", "extra_time")

    def extra_time_minute(self, obj):
        return obj.extra_time_int
    extra_time_minute.short_description = "Extra time in Minutes"

# @admin.register(UserProfile)
# class UserProfileAdmin(admin.ModelAdmin):
#     list_display = [field.name for field in UserProfile._meta.get_fields()]

@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("id","user","firstname","lastname","role","bereich","telephone","employee_group")
    fields = ("user","firstname","lastname","role","bereich","telephone","employee_group")

@admin.register(EmployeeGroup)
class EmployeeGroupAdmin(admin.ModelAdmin):
    list_display = ("id", "group", "get_employees")
    fields = ("group",)
    def get_employees(self, obj):
        return ", ".join([f"{user.firstname} {user.lastname}" for user in obj.employees.all()])
    get_employees.short_description = 'Employees'

@admin.register(ShiftAssignment)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ("group", "shift","starting_date","ending_date")
    list_display = ["group","shift","starting_date","ending_date"]

@admin.register(LedValueCases)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ("description","functionality","value")
    fields = ("description","functionality","value")

@admin.register(Request)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ("user", "description",
              "servicelog", "button_pushed", "cancelled_by_frontend",
              "sent_to_plc", "sent_to_frontend","access", "time","status")
    list_display = ("id", "time","user", "cabinet","rack", "door", "status",
              "servicelog", "button_pushed", "cancelled_by_frontend",
              "sent_to_plc", "sent_to_frontend","access","description")

@admin.register(UserLog)
class UserProfileAdmin(admin.ModelAdmin):
    fields = ()
    list_display = ("id", "user", "request", "servicelog")