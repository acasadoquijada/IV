from fabric.api import run, local, hosts, cd
from fabric.contrib import django

#Ejecutamos la app
def ejecutarApp():
	run('cd proyectoIV && make run')
