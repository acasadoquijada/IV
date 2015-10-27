from django.contrib import admin

from .models import ComunidadAutonoma, Provincia, Pueblo, Restaurante

class AdminCA(admin.ModelAdmin):
	list_display = ('nombre','fecha_de_alta')

class AdminProvincia(admin.ModelAdmin):
	list_display = ('nombre', 'votos','comunidad_autonoma')

class AdminPueblo(admin.ModelAdmin):
	list_display = ('nombre', 'habitantes','votos','provincia')

admin.site.register(ComunidadAutonoma,AdminCA)
admin.site.register(Provincia,AdminProvincia)
admin.site.register(Pueblo,AdminPueblo)

