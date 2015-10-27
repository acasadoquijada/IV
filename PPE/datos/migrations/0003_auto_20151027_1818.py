# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('datos', '0002_pueblo_habitantes'),
    ]

    operations = [
        migrations.RenameField(
            model_name='provincia',
            old_name='comunidadautonoma',
            new_name='comunidad_autonoma',
        ),
    ]
