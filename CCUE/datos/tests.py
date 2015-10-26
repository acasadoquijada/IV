import datetime

from django.utils import timezone
from django.test import TestCase

from .models import Universidad, Grado, Asignatura

class Test(TestCase):

	def test_crear_universidad(self):

		u = Universidad(nombre = "Universidad1", abreviatura = "UNI", fecha_de_alta=timezone.now())
		
		u.save()

		self.assertEqual(u.nombre, "Universidad1")
		print("Test: creación y salvado de universidad correcto")

	def test_crear_grado(self):

		u = Universidad(nombre = "Universidad1", abreviatura = "UNI", fecha_de_alta=timezone.now())
		
		u.save()

		g = Grado(universidad = u, nombre = "Grado1", abreviatura = "GRA", 
		tipo="Ciencias",fecha_de_alta=timezone.now())

		g.save()
		self.assertEqual(g.universidad, u)
		print("Test: creación y salvado de universidad, grado correcto")



	def test_crear_asignatura(self):

		u = Universidad(nombre = "Universidad1", abreviatura = "UNI", fecha_de_alta=timezone.now())
		
		u.save()

		g = Grado(universidad = u, nombre = "PGrado1rueba", abreviatura = "GRA",
		 tipo="Ciencias",fecha_de_alta=timezone.now())

		g.save()

		a = Asignatura(grado = g, nombre = "Asignatura", abreviatura = "ASG",
 		curso = "2", especialidad = "Hola", fecha_de_alta=timezone.now())


		self.assertEqual(a.grado, g)
		print("Test: creación y salvado de universidad, grado, asignatura correcto")

	def test_comprobar_abreviatura_universidad(self):
		
		u = Universidad(nombre = "Universidad1", abreviatura = "UNI", fecha_de_alta=timezone.now())
	
		g = Grado(universidad = u, nombre = "PGrado1rueba", abreviatura = "GRA",
		 tipo="Ciencias",fecha_de_alta=timezone.now())

		abreviatura = g.abreviatura_universidad()
		self.assertEqual(abreviatura, u.abreviatura)
		print("Test: comprobación abreviatura universidad en grado correcto")

