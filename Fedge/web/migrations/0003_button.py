# Generated by Django 4.2.3 on 2023-07-27 00:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0002_door_qr_alter_cabinet_anlage_alter_cabinet_segment_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Button',
            fields=[
                ('ports_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='web.ports')),
                ('module_type', models.CharField(choices=[('BUTTON', 'Door button')], max_length=20)),
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
                ('iolink', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.io_link')),
            ],
            bases=('web.ports',),
        ),
    ]
