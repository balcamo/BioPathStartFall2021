# Generated by Django 2.1.3 on 2019-02-04 23:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('testApp', '0012_auto_20190204_2353'),
    ]

    operations = [
        migrations.CreateModel(
            name='Products',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product', models.CharField(max_length=200)),
                ('module', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='testApp.Module')),
            ],
        ),
        migrations.CreateModel(
            name='Substrates',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('substrate', models.CharField(max_length=200)),
                ('module', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='testApp.Module')),
            ],
        ),
    ]