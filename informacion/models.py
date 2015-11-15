from django.db import models

# Create your models here.

from django.db import models

class ComunidadAutonoma(models.Model):
	nombre = models.CharField(max_length=30)
	fecha_de_alta = models.DateTimeField('date published')


	def __str__(self):
		return self.nombre

class Provincia(models.Model):
	comunidad_autonoma = models.ForeignKey(ComunidadAutonoma)
	nombre = models.CharField(max_length=30)
	votos = models.IntegerField(default=0)
	
	def __str__(self):
		return self.nombre

class Pueblo(models.Model):
	provincia = models.ForeignKey(Provincia)
	nombre = models.CharField(max_length=30)
	habitantes = models.IntegerField(default=0)
	votos = models.IntegerField(default=0)


	def __str__(self):
		return self.nombre

class Restaurante(models.Model):
	pueblo = models.ForeignKey(Pueblo)
	nombre = models.CharField(max_length=50)

	puntuacion = models.IntegerField(default=0)

	def __str__(self):
		return self.nombre

	def get_puntuacion(self):
		return self.puntuacion
