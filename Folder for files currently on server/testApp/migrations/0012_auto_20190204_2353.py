# Generated by Django 2.1.3 on 2019-02-04 23:53

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('testApp', '0011_module'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='module',
            name='product',
        ),
        migrations.RemoveField(
            model_name='module',
            name='substrate',
        ),
    ]