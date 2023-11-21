# Generated by Django 4.2.3 on 2023-11-21 14:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cabinet',
            name='bereich',
            field=models.CharField(choices=[('K', 'Karosseriebau'), ('F', 'Fördertechnik'), ('M', 'Montage'), ('I', 'Inhouse Logistik'), ('P', 'Presswerk'), ('L', 'Lackiererei'), ('B', 'Batteriefertigung'), ('C', 'Komponente')], help_text='it must have at least one character', max_length=1),
        ),
    ]
