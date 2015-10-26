from django.db import models
from django.contrib.auth.models import User


class Universidad(models.Model):
	nombre = models.CharField(max_length=200)
	abreviatura = models.CharField(max_length=3)
	fecha_de_alta = models.DateTimeField('date published')

	def __str__(self):              
		return self.nombre

class Grado(models.Model):

	universidad = models.ForeignKey(Universidad)
	nombre = models.CharField(max_length=50)
	abreviatura = models.CharField(max_length=4)
	tipo = models.CharField(max_length=20)
	fecha_de_alta = models.DateTimeField('date published')

	def __str__(self):              
		return self.nombre

	def abreviatura_universidad(self):
		return self.universidad.abreviatura 

class Asignatura(models.Model):
	grado = models.ForeignKey(Grado)
	nombre = models.CharField(max_length=50)
	abreviatura = models.CharField(max_length=4)
	curso = models.IntegerField()
	especialidad = models.CharField(max_length=50)
	fecha_de_alta = models.DateTimeField('date published')

	def __str__(self):              
		return self.nombre
