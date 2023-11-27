# Generated by Django 4.2.3 on 2023-11-24 17:14

from django.db import migrations, models
import timescale.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0002_alter_plc_profinet_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='buttonvalue',
            name='time',
            field=timescale.db.models.fields.TimescaleDateTimeField(interval='7 day'),
        ),
        migrations.AlterField(
            model_name='doorsensorvalue',
            name='time',
            field=timescale.db.models.fields.TimescaleDateTimeField(interval='7 day'),
        ),
        migrations.AlterField(
            model_name='energysensorvalue',
            name='time',
            field=timescale.db.models.fields.TimescaleDateTimeField(interval='7 day'),
        ),
        migrations.AlterField(
            model_name='latchsensorvalue',
            name='time',
            field=timescale.db.models.fields.TimescaleDateTimeField(interval='7 day'),
        ),
        migrations.AlterField(
            model_name='latchvalue',
            name='time',
            field=timescale.db.models.fields.TimescaleDateTimeField(interval='7 day'),
        ),
        migrations.AlterField(
            model_name='ledvalue',
            name='time',
            field=timescale.db.models.fields.TimescaleDateTimeField(interval='7 day'),
        ),
        migrations.AlterField(
            model_name='plc',
            name='profinet_name',
            field=models.CharField(default=None, editable=False, max_length=22, unique=True),
        ),
        migrations.AlterField(
            model_name='temperaturesensorvalue',
            name='time',
            field=timescale.db.models.fields.TimescaleDateTimeField(interval='7 day'),
        ),
    ]
