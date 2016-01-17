"""
WSGI config for practica4 project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/howto/deployment/wsgi/
"""

import os
from whitenoise.django import DjangoWhiteNoise
from django.core.wsgi import get_wsgi_application
from dj_static import Cling


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "practica4.settings")

application = get_wsgi_application()

application = Cling(get_wsgi_application())
#application = DjangoWhiteNoise(application)
