from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
	url(r'^lista_pueblos$', views.lista_pueblo, name='lista_pueblos'),

]
