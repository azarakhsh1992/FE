# Generated by Django 4.2.3 on 2023-11-17 21:04

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cabinet',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bereich', models.CharField(choices=[('k', 'Karosseriebau'), ('f', 'Fördertechnik'), ('m', 'Montage'), ('i', 'Inhouse Logistik'), ('p', 'Presswerk'), ('l', 'Lackiererei'), ('b', 'Batteriefertigung'), ('c', 'Komponente')], help_text='it must have at least one character', max_length=1)),
                ('segment', models.CharField(help_text='it must have at least one character', max_length=1)),
                ('anlage', models.CharField(help_text='it must have at least four character', max_length=4)),
                ('arg_sps', models.CharField(help_text='it must have at least one character', max_length=1)),
                ('pultbereich_sk', models.CharField(help_text='it must have at least one character', max_length=1)),
                ('station', models.CharField(help_text='it must have at least four character', max_length=4)),
                ('profinet_name', models.CharField(editable=False, max_length=12, unique=True)),
            ],
            options={
                'unique_together': {('bereich', 'segment', 'anlage', 'arg_sps', 'pultbereich_sk', 'station')},
            },
        ),
        migrations.CreateModel(
            name='Device',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bmk', models.CharField(default=None, max_length=3)),
                ('geraet', models.CharField(default=None, max_length=3)),
                ('serial_number', models.CharField(max_length=50, unique=True)),
                ('manufacturer', models.CharField(max_length=50)),
                ('profinet_name', models.CharField(editable=False, max_length=22, unique=True)),
                ('this_module_type', models.CharField(default='not defined', editable=False, max_length=32)),
                ('io_module', models.CharField(choices=[('DI', 'DI'), ('DO', 'DO'), ('IOL', 'IOL'), ('EM', 'EM')], default=None, max_length=4)),
                ('port', models.CharField(choices=[('P0', 'P0'), ('P1', 'P1'), ('P2', 'P2'), ('P3', 'P3'), ('P4', 'P4'), ('P5', 'P5'), ('P6', 'P6'), ('P7', 'P7'), ('P8', 'P8'), ('P9', 'P9'), ('P10', 'P10'), ('P11', 'P11'), ('P12', 'P12'), ('P13', 'P13'), ('P14', 'P14'), ('P15', 'P15'), ('P16', 'P16')], default=None, max_length=4)),
            ],
        ),
        migrations.CreateModel(
            name='Door',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('direction', models.CharField(choices=[('Front', 'Front'), ('Rear', 'Rear'), ('NetworkOrEnergy', 'Network/Energy')], max_length=32)),
                ('qr', models.CharField(blank=True, editable=False, max_length=32, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='EmployeeGroup',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('group', models.CharField(choices=[('group1', 'Group 1'), ('group2', 'Group 2'), ('group3', 'Group 3'), ('group4', 'Group 4')], default=None, max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Rack',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(choices=[('Edge_A', 'Edge_A'), ('Edge_B', 'Edge_B'), ('Network', 'Network'), ('Energy', 'Energy'), ('Cooling', 'Cooling')], default=None, max_length=16)),
                ('cabinet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='racks', to='web.cabinet')),
            ],
            options={
                'unique_together': {('name', 'cabinet')},
            },
        ),
        migrations.CreateModel(
            name='Request',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=255)),
                ('servicelog', models.BooleanField(default=False)),
                ('buttonstatus', models.BooleanField(default=False)),
                ('cancelinghdw', models.BooleanField(default=False)),
                ('cancelingfrnt', models.BooleanField(default=False)),
                ('sendtomiddleware', models.BooleanField(default=False)),
                ('sendtofrontend', models.BooleanField(default=False)),
                ('datetime', models.DateTimeField()),
                ('cabinet', models.ForeignKey(editable=False, on_delete=django.db.models.deletion.CASCADE, related_name='requests', to='web.cabinet')),
                ('door', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='requests', to='web.door')),
                ('rack', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='requests', to='web.rack')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='requests', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='DoorSensor',
            fields=[
                ('device_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.device')),
                ('door_direction', models.CharField(choices=[('Front', 'Front'), ('Rear', 'Rear'), ('NetworkOrEnergy', 'Network/Energy')], max_length=32)),
                ('rack_name', models.CharField(choices=[('Edge_A', 'Edge_A'), ('Edge_B', 'Edge_B'), ('Network', 'Network'), ('Energy', 'Energy'), ('Cooling', 'Cooling')], default=None, max_length=16)),
            ],
            bases=('web.device',),
        ),
        migrations.CreateModel(
            name='EnergysensorDevice',
            fields=[
                ('device_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.device')),
                ('measuring_env', models.CharField(choices=[('EM1', 'EM1'), ('ME2', 'EM2')], default=None, max_length=4, unique=True)),
            ],
            bases=('web.device',),
        ),
        migrations.CreateModel(
            name='Latch',
            fields=[
                ('device_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.device')),
                ('door_direction', models.CharField(choices=[('Front', 'Front'), ('Rear', 'Rear'), ('NetworkOrEnergy', 'Network/Energy')], max_length=32)),
                ('rack_name', models.CharField(choices=[('Edge_A', 'Edge_A'), ('Edge_B', 'Edge_B'), ('Network', 'Network'), ('Energy', 'Energy'), ('Cooling', 'Cooling')], default=None, max_length=16)),
            ],
            bases=('web.device',),
        ),
        migrations.CreateModel(
            name='LatchSensor',
            fields=[
                ('device_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.device')),
                ('door_direction', models.CharField(choices=[('Front', 'Front'), ('Rear', 'Rear'), ('NetworkOrEnergy', 'Network/Energy')], max_length=32)),
                ('rack_name', models.CharField(choices=[('Edge_A', 'Edge_A'), ('Edge_B', 'Edge_B'), ('Network', 'Network'), ('Energy', 'Energy'), ('Cooling', 'Cooling')], default=None, max_length=16)),
            ],
            bases=('web.device',),
        ),
        migrations.CreateModel(
            name='LED',
            fields=[
                ('device_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.device')),
                ('door_direction', models.CharField(choices=[('Front', 'Front'), ('Rear', 'Rear'), ('NetworkOrEnergy', 'Network/Energy')], max_length=32)),
                ('rack_name', models.CharField(choices=[('Edge_A', 'Edge_A'), ('Edge_B', 'Edge_B'), ('Network', 'Network'), ('Energy', 'Energy'), ('Cooling', 'Cooling')], default=None, max_length=16)),
            ],
            bases=('web.device',),
        ),
        migrations.CreateModel(
            name='TemperatureSensor',
            fields=[
                ('device_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.device')),
                ('measuring_env', models.CharField(choices=[('Edge_A_top', 'Edge_A_top'), ('Edge_A_middle', 'Edge_A_middle'), ('Edge_A_bottom', 'Edge_A_bottom'), ('Edge_B_top', 'Edge_B_top'), ('Edge_B_middle', 'Edge_B_middle'), ('Edge_B_bottom', 'Edge_B_bottom'), ('Network', 'Network'), ('Energy', 'Energy')], default=None, max_length=16, unique=True)),
            ],
            bases=('web.device',),
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstname', models.CharField(blank=True, max_length=250, null=True)),
                ('lastname', models.CharField(blank=True, max_length=250, null=True)),
                ('role', models.CharField(choices=[('Elektriker', 'Elektriker'), ('Anlagen', 'Anlagenfuehrer'), ('IT', 'IT Shopfloor'), ('Netzwerk', 'Netzwerktechniker'), ('IH', 'Instandhalter')], default=None, max_length=100)),
                ('bereich', models.CharField(choices=[('K', 'Karosseriebau'), ('F', 'Foerdertechnik'), ('M', 'Montage'), ('I', 'Inhouse Logistik'), ('P', 'Presswerk'), ('L', 'Lackiererei'), ('B', 'Batteriefertigung'), ('C', 'Komponente')], default=None, max_length=1)),
                ('telephone', models.CharField(blank=True, max_length=15, null=True)),
                ('employee_group', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='employee_group', to='web.employeegroup')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='profile', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Shifts',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('shift', models.CharField(choices=[('Early', 'Early:Früh'), ('Late', 'Late:Spät'), ('Night', 'Night:Nacht'), ('Normal', 'Normal')], default=None, max_length=10)),
                ('date', models.DateField()),
                ('group', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='employeegroup', to='web.employeegroup')),
            ],
        ),
        migrations.CreateModel(
            name='Servicelog',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField()),
                ('datetime', models.DateTimeField()),
                ('request', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='servicelogs', to='web.request')),
            ],
        ),
        migrations.CreateModel(
            name='PLC',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('funktionseinheit', models.CharField(default=None, help_text='it must have at least three character', max_length=3)),
                ('ip_address', models.GenericIPAddressField(default=None, unique=True)),
                ('serial_number', models.CharField(max_length=32, unique=True)),
                ('mac_address', models.CharField(default=None, max_length=32)),
                ('profinet_name', models.CharField(default=None, editable=False, max_length=18, unique=True)),
                ('cabinet', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='plc', to='web.cabinet')),
            ],
        ),
        migrations.AddField(
            model_name='door',
            name='rack',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='doors', to='web.rack'),
        ),
        migrations.AddField(
            model_name='device',
            name='plc',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='plcdevices', to='web.plc'),
        ),
        migrations.CreateModel(
            name='TemperatureSensorValue',
            fields=[
                ('time', models.DateTimeField(auto_now_add=True, primary_key=True, serialize=False)),
                ('tempvalue', models.FloatField(null=True)),
                ('tempvalue_min', models.FloatField(null=True)),
                ('tempvalue_max', models.FloatField(null=True)),
                ('humidvalue', models.FloatField(null=True)),
                ('fault', models.BooleanField(default=False)),
                ('temperaturesensordevice', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='temperaturesensorvalue', to='web.temperaturesensor')),
            ],
        ),
        migrations.CreateModel(
            name='LedValue',
            fields=[
                ('time', models.DateTimeField(auto_now=True, primary_key=True, serialize=False)),
                ('value', models.BooleanField(null=True)),
                ('fault', models.BooleanField(default=False)),
                ('led', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='ledvalue', to='web.led')),
            ],
        ),
        migrations.AddField(
            model_name='led',
            name='device_door',
            field=models.OneToOneField(editable=False, on_delete=django.db.models.deletion.CASCADE, related_name='leds', to='web.door'),
        ),
        migrations.CreateModel(
            name='LatchValue',
            fields=[
                ('time', models.DateTimeField(auto_now=True, primary_key=True, serialize=False)),
                ('value', models.CharField(max_length=8, null=True)),
                ('fault', models.BooleanField(default=False)),
                ('latch', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='latchvalue', to='web.latch')),
            ],
        ),
        migrations.CreateModel(
            name='LatchSensorValue',
            fields=[
                ('time', models.DateTimeField(auto_now=True, primary_key=True, serialize=False)),
                ('value', models.BooleanField(null=True)),
                ('fault', models.BooleanField(default=False)),
                ('latchsensor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='latchsensorvalue', to='web.latchsensor')),
            ],
        ),
        migrations.AddField(
            model_name='latchsensor',
            name='device_door',
            field=models.OneToOneField(editable=False, on_delete=django.db.models.deletion.CASCADE, related_name='latchsensors', to='web.door'),
        ),
        migrations.AddField(
            model_name='latch',
            name='device_door',
            field=models.OneToOneField(editable=False, on_delete=django.db.models.deletion.CASCADE, related_name='latchs', to='web.door'),
        ),
        migrations.CreateModel(
            name='EnergySensorValue',
            fields=[
                ('time', models.DateTimeField(auto_now=True, primary_key=True, serialize=False)),
                ('energy_value', models.FloatField(null=True)),
                ('energy_unit', models.CharField(default='KWh', max_length=4)),
                ('power_value', models.FloatField(null=True)),
                ('power_unit', models.CharField(default='KW', max_length=4)),
                ('fault', models.BooleanField(default=False)),
                ('energysensordevice', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='energysensorvalue', to='web.energysensordevice')),
            ],
        ),
        migrations.CreateModel(
            name='DoorsensorValue',
            fields=[
                ('time', models.DateTimeField(auto_now=True, primary_key=True, serialize=False)),
                ('value', models.BooleanField(null=True)),
                ('fault', models.BooleanField(default=False)),
                ('doorsensordevice', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='doorsensorvalue', to='web.doorsensor')),
            ],
        ),
        migrations.AddField(
            model_name='doorsensor',
            name='device_door',
            field=models.OneToOneField(editable=False, on_delete=django.db.models.deletion.CASCADE, related_name='doorsensors', to='web.door'),
        ),
        migrations.CreateModel(
            name='DoorButton',
            fields=[
                ('device_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.device')),
                ('door_direction', models.CharField(choices=[('Front', 'Front'), ('Rear', 'Rear'), ('NetworkOrEnergy', 'Network/Energy')], max_length=32)),
                ('rack_name', models.CharField(choices=[('Edge_A', 'Edge_A'), ('Edge_B', 'Edge_B'), ('Network', 'Network'), ('Energy', 'Energy'), ('Cooling', 'Cooling')], default=None, max_length=16)),
                ('device_door', models.OneToOneField(editable=False, on_delete=django.db.models.deletion.CASCADE, related_name='doorbuttons', to='web.door')),
            ],
            bases=('web.device',),
        ),
        migrations.AlterUniqueTogether(
            name='door',
            unique_together={('direction', 'rack')},
        ),
        migrations.AlterUniqueTogether(
            name='device',
            unique_together={('port', 'io_module', 'plc')},
        ),
        migrations.CreateModel(
            name='ButtonValue',
            fields=[
                ('time', models.DateTimeField(auto_now=True, primary_key=True, serialize=False)),
                ('value', models.BooleanField(null=True)),
                ('fault', models.BooleanField(default=False)),
                ('doorbutton', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='buttonvalue', to='web.doorbutton')),
            ],
        ),
    ]
