from django.shortcuts import render
from django.http import HttpResponse
from .models import Pueblo
# Create your views here.

def index(request):
	return render(request, 'informacion/base.html')	
	#return HttpResponse("¡Bienvenido a pequeños pueblos españoles!")

def lista_pueblo(request):
	
	lista_pueblos = Pueblo.objects.order_by('nombre')
	context = { 'lista_pueblos' : lista_pueblos }
	return render(request, 'informacion/lista_pueblos.html', context)