# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('datos', '0002_delete_usuario'),
    ]

    operations = [
        migrations.CreateModel(
            name='Asignatura',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('abreviatura', models.CharField(max_length=4)),
                ('curso', models.IntegerField()),
                ('especialidad', models.CharField(max_length=50)),
                ('fecha_de_alta', models.DateTimeField(verbose_name='date published')),
            ],
        ),
        migrations.CreateModel(
            name='Grado',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
                ('abreviatura', models.CharField(max_length=4)),
                ('tipo', models.CharField(max_length=20)),
                ('fecha_de_alta', models.DateTimeField(verbose_name='date published')),
            ],
        ),
        migrations.CreateModel(
            name='Universidad',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=200)),
                ('abreviatura', models.CharField(max_length=3)),
                ('fecha_de_alta', models.DateTimeField(verbose_name='date published')),
            ],
        ),
        migrations.AddField(
            model_name='grado',
            name='universidad',
            field=models.ForeignKey(to='datos.Universidad'),
        ),
        migrations.AddField(
            model_name='asignatura',
            name='grado',
            field=models.ForeignKey(to='datos.Grado'),
        ),
    ]
