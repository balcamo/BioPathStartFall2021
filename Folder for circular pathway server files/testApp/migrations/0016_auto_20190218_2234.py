# Generated by Django 2.1.2 on 2019-02-18 22:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('testApp', '0015_auto_20190218_2229'),
    ]

    operations = [
        migrations.RenameField(
            model_name='products',
            old_name='module',
            new_name='moduleID',
        ),
        migrations.RenameField(
            model_name='substrates',
            old_name='module',
            new_name='moduleID',
        ),
    ]