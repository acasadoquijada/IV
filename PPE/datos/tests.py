import datetime

from django.utils import timezone
from django.test import TestCase

from .models import Provincia, ComunidadAutonoma, Pueblo, Restaurante
# Create your tests here.

class TestComunidadAutonoma(TestCase):

	def test_crear_comunidad_a(self):
		ca = ComunidadAutonoma(nombre="CCAA", fecha_de_alta=timezone.now())
		ca.save()
		self.assertEqual(ca.nombre, "CCAA")
		print("Test: creación y salvado de CCAA correcto")

class TestProvincia(TestCase):

	def test_crear_provincia(self):

		ca = ComunidadAutonoma(nombre="CCAA", fecha_de_alta=timezone.now())
		ca.save()

		p = Provincia(comunidad_autonoma=ca,nombre="Provincia", votos = 0)

		p.save()
		self.assertEqual(ca, p.comunidad_autonoma)
		print("Test: creación y salvado de provincia correcto")

class TestPueblo(TestCase):

	def test_crear_pueblo(self):

		ca = ComunidadAutonoma(nombre="CCAA", fecha_de_alta=timezone.now())
		ca.save()

		p = Provincia(comunidad_autonoma=ca,nombre="Provincia", votos = 0)

		p.save()

		pue = Pueblo(provincia = p, nombre="test", habitantes ="288", votos = "2")

		pue.save()
		self.assertEqual(p, pue.provincia)
		print("Test: creación y salvado de pueblo correcto")
