# Generated by Django 4.2.4 on 2023-08-04 11:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='json_draft',
            old_name='this_data',
            new_name='data',
        ),
        migrations.RenameField(
            model_name='json_draft',
            old_name='this_url',
            new_name='url',
        ),
        migrations.RemoveField(
            model_name='json_draft',
            name='body',
        ),
    ]
