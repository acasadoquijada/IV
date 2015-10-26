from django.contrib import admin

from .models import Universidad, Grado, Asignatura

class AdminUniversidad(admin.ModelAdmin):
	list_display = ('nombre', 'abreviatura')

class AdminGrado(admin.ModelAdmin):
	list_display = ('nombre', 'abreviatura','universidad')

class AdminAsignatura(admin.ModelAdmin):
	list_display = ('nombre', 'abreviatura','grado','curso')

admin.site.register(Universidad,AdminUniversidad)
admin.site.register(Grado,AdminGrado)
admin.site.register(Asignatura,AdminAsignatura)
