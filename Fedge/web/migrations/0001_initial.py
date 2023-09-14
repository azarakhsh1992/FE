# Generated by Django 4.2.3 on 2023-09-14 16:27

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
                ('bereich', models.CharField(choices=[('K', 'Karosseriebau'), ('F', 'Fördertechnik'), ('M', 'Montage'), ('I', 'Inhouse Logistik'), ('P', 'Presswerk'), ('L', 'Lackiererei'), ('B', 'Batteriefertigung'), ('C', 'Komponente')], default=None, max_length=1)),
                ('segment', models.CharField(help_text='it must have at least one character', max_length=1)),
                ('anlage', models.CharField(help_text='it must have at least four character', max_length=4)),
                ('arg_sps', models.CharField(max_length=1)),
                ('pultbereich_sk', models.CharField(max_length=1)),
                ('station', models.CharField(max_length=4)),
                ('funktionseinheit', models.CharField(max_length=3)),
                ('profinet_name', models.CharField(default=None, editable=False, max_length=15, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Door',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('qr', models.CharField(blank=True, editable=False, max_length=20, unique=True)),
                ('name', models.CharField(max_length=50)),
                ('profinet_name', models.CharField(max_length=100)),
                ('direction', models.CharField(choices=[('FRONT', 'front'), ('BACK', 'back')], default=None, max_length=20)),
                ('section', models.CharField(choices=[('NETWORK', 'IT Network'), ('PS', 'Powe supply'), ('FE', 'Factory Edge Server')], default=None, max_length=20)),
                ('cabinet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.cabinet')),
            ],
            options={
                'unique_together': {('name', 'cabinet')},
            },
        ),
        migrations.CreateModel(
            name='GroupShift',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('group', models.CharField(choices=[('group1', 'Group 1'), ('group2', 'Group 2'), ('group3', 'Group 3')], default=None, max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Iol_Module',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bmk', models.CharField(default=None, max_length=3)),
                ('serial_number', models.CharField(max_length=50, unique=True)),
                ('manufacturer', models.CharField(max_length=50)),
                ('profinet_address', models.GenericIPAddressField(default=None, editable=False)),
                ('profinet_name', models.CharField(default=None, editable=False, max_length=22)),
                ('bereich', models.CharField(choices=[('K', 'Karosseriebau'), ('F', 'Fördertechnik'), ('M', 'Montage'), ('I', 'Inhouse Logistik'), ('P', 'Presswerk'), ('L', 'Lackiererei'), ('B', 'Batteriefertigung'), ('C', 'Komponente')], editable=False, max_length=1)),
                ('segment', models.CharField(editable=False, max_length=1)),
                ('anlage', models.CharField(editable=False, max_length=4)),
                ('arg_sps', models.CharField(editable=False, max_length=1)),
                ('pultbereich_sk', models.CharField(editable=False, max_length=1)),
                ('station', models.CharField(editable=False, max_length=4)),
                ('funktionseinheit', models.CharField(editable=False, max_length=3)),
                ('geraet', models.CharField(editable=False, max_length=3)),
                ('port', models.CharField(choices=[('X1', 'X1'), ('X2', 'X2'), ('X3', 'X3'), ('X4', 'X4'), ('X5', 'X5'), ('X6', 'X6'), ('X7', 'X7'), ('X8', 'X8')], default=None, max_length=5)),
            ],
        ),
        migrations.CreateModel(
            name='Json_draft',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128)),
                ('code', models.CharField(default='request', max_length=64)),
                ('cid', models.IntegerField(default=4711)),
                ('adr', models.CharField(default='/iolinkmaster/port[2]/iolinkdevice/pdin/getdata', max_length=128)),
                ('url', models.URLField(default='http://192.168.0.4', max_length=32)),
                ('data', models.TextField(blank=True, max_length=256)),
                ('sensor', models.CharField(max_length=256)),
                ('command', models.CharField(max_length=256)),
            ],
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
                ('datetime', models.DateTimeField()),
                ('cabinet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='requests', to='web.cabinet')),
                ('door', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='requests', to='web.door')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='requests', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='ButtonDevice',
            fields=[
                ('iol_module_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.iol_module')),
            ],
            bases=('web.iol_module',),
        ),
        migrations.CreateModel(
            name='DoorsensorDevice',
            fields=[
                ('iol_module_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.iol_module')),
            ],
            bases=('web.iol_module',),
        ),
        migrations.CreateModel(
            name='LedDevice',
            fields=[
                ('iol_module_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.iol_module')),
            ],
            bases=('web.iol_module',),
        ),
        migrations.CreateModel(
            name='LockactuatorDevice',
            fields=[
                ('iol_module_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.iol_module')),
            ],
            bases=('web.iol_module',),
        ),
        migrations.CreateModel(
            name='TemperaturesensorDevice',
            fields=[
                ('iol_module_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.iol_module')),
                ('measuring_env', models.CharField(choices=[('IN', 'inside'), ('OUT', 'outside')], default='IN', max_length=8)),
            ],
            bases=('web.iol_module',),
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('accessable_cabinets', models.CharField(max_length=500, null=True)),
                ('firstname', models.CharField(blank=True, max_length=250, null=True)),
                ('lastname', models.CharField(blank=True, max_length=250, null=True)),
                ('role', models.CharField(blank=True, choices=[('TECHNICIAN', 'Technician'), ('PLANT_OPERATOR', 'Plant Operator'), ('IT_SHOPFLOOR', 'IT Shopfloor')], default=None, max_length=100, null=True)),
                ('bereich', models.CharField(blank=True, choices=[('K', 'Karosseriebau'), ('F', 'Foerdertechnik'), ('M', 'Montage'), ('I', 'Inhouse Logistik'), ('P', 'Presswerk'), ('L', 'Lackiererei'), ('B', 'Batteriefertigung'), ('C', 'Komponente')], default=None, max_length=1, null=True)),
                ('telephone', models.CharField(blank=True, max_length=15, null=True)),
                ('group', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='usergroup', to='web.groupshift')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='profile', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='ShiftOfGroup',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('shift', models.CharField(choices=[('FRUEH', 'Frueh'), ('SPAET', 'Spaet'), ('NACHT', 'Nacht')], default=None, max_length=10)),
                ('date', models.DateField()),
                ('group', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='groupshift', to='web.groupshift')),
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
            name='Iolink',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('geraet', models.CharField(max_length=3)),
                ('module_type', models.CharField(choices=[('IO_LINK', 'IO_Link Master')], max_length=10)),
                ('profinet_address', models.GenericIPAddressField(default=None, unique=True)),
                ('serial_number', models.CharField(max_length=50, unique=True)),
                ('profinet_name', models.CharField(default=None, editable=False, max_length=18)),
                ('bereich', models.CharField(choices=[('K', 'Karosseriebau'), ('F', 'Fördertechnik'), ('M', 'Montage'), ('I', 'Inhouse Logistik'), ('P', 'Presswerk'), ('L', 'Lackiererei'), ('B', 'Batteriefertigung'), ('C', 'Komponente')], editable=False, max_length=1)),
                ('segment', models.CharField(editable=False, max_length=1)),
                ('anlage', models.CharField(editable=False, max_length=4)),
                ('arg_sps', models.CharField(editable=False, max_length=1)),
                ('pultbereich_sk', models.CharField(editable=False, max_length=1)),
                ('station', models.CharField(editable=False, max_length=4)),
                ('funktionseinheit', models.CharField(editable=False, max_length=3)),
                ('cabinet', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='iolink', to='web.cabinet')),
            ],
        ),
        migrations.AddField(
            model_name='iol_module',
            name='iolink',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='iolmodules', to='web.iolink'),
        ),
        migrations.CreateModel(
            name='TemperaturesensorValue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tempvalue', models.FloatField(default=0)),
                ('humidvalue', models.FloatField(default=0)),
                ('timestamp', models.DateTimeField()),
                ('temperaturesensordevice', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='temperaturesensorvalue', to='web.temperaturesensordevice')),
            ],
        ),
        migrations.CreateModel(
            name='LockactuatorValue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.BooleanField(default=False)),
                ('timestamp', models.DateTimeField()),
                ('lockactuatordevice', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='lockactuatorvalue', to='web.lockactuatordevice')),
            ],
        ),
        migrations.CreateModel(
            name='LedValue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.BooleanField(default=False)),
                ('timestamp', models.DateTimeField()),
                ('leddevice', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='ledvalue', to='web.leddevice')),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='iol_module',
            unique_together={('port', 'iolink')},
        ),
        migrations.CreateModel(
            name='DoorsensorValue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.BooleanField(default=False)),
                ('timestamp', models.DateTimeField()),
                ('doorsensordevice', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='doorsensorvalue', to='web.doorsensordevice')),
            ],
        ),
        migrations.CreateModel(
            name='ButtonValues',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.BooleanField(default=False)),
                ('timestamp', models.DateTimeField()),
                ('btndevice', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='btnvalue', to='web.buttondevice')),
            ],
        ),
    ]
