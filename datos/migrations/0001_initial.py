# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ComunidadAutonoma',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, primary_key=True, auto_created=True)),
                ('nombre', models.CharField(max_length=30)),
                ('fecha_de_alta', models.DateTimeField(verbose_name='date published')),
            ],
        ),
        migrations.CreateModel(
            name='Provincia',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, primary_key=True, auto_created=True)),
                ('nombre', models.CharField(max_length=30)),
                ('votos', models.IntegerField(default=0)),
                ('comunidadautonoma', models.ForeignKey(to='datos.ComunidadAutonoma')),
            ],
        ),
        migrations.CreateModel(
            name='Pueblo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, primary_key=True, auto_created=True)),
                ('nombre', models.CharField(max_length=30)),
                ('votos', models.IntegerField(default=0)),
                ('provincia', models.ForeignKey(to='datos.Provincia')),
            ],
        ),
        migrations.CreateModel(
            name='Restaurante',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, primary_key=True, auto_created=True)),
                ('nombre', models.CharField(max_length=50)),
                ('puntuacion', models.IntegerField(default=0)),
                ('pueblo', models.ForeignKey(to='datos.Pueblo')),
            ],
        ),
    ]
