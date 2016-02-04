##Puesta en producción

En este capítulo se explica la puesta en producción de la aplicación explicada para la asignatura DAI, por eso se van a comentar cosas que o se han visto en capítulos anteriores o se verán en posteriores.

Lo primero que tenemos que hacer es editar nuestro archivo [setting.py](../proyectoDAI/settings.py) y realizar los siguientes cambios:

* `DEBUG = False`

* `ALLOWED_HOSTS = ['*']`

![setting](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/setting_zpslcajqoro.png)

Una vez hecho lo anterior procedemos a desplegarlo a Heroku.

El propio heroku se encarga de copiar los [archivos estaticos](https://devcenter.heroku.com/articles/django-assets#automatic-collectstatic)

![snap](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/heroku_zpsiz9mqjp4.png) 

También es necesario usar [whitenoise](https://devcenter.heroku.com/articles/django-assets#whitenoise) para los archivos estáticos, por lo que he decidio usarlo, se puede ver que uso whitenoise visitando mi fichero [requirements.txt](../requirements.txt)

Tras configurar correctamente la integración continua desplegaremos la aplicación a Heroku, para ver como se ha realizado el despliegue podemos consultar este [enlace](despliegue-heroku.md#despliegue-heroku)

Una vez realizado todo lo anterior, podemos comprobar que al intentar acceder a una url que no se encuentra en el servidor no aparece un mensaje de debug

![despliegue-dai](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%204/desplieuge-dai_zps4fprszx5.png)


[capítulo anterior](capitulo3-test.md) [capítulo siguiente](capitulo5-integracion-continua.md)







