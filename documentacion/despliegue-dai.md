###Despliegue DAI

Lo primero que tenemos que hacer es editar nuestro archivo [setting.py](../proyectoDAI/settings.py) y realizar los siguientes cambios:

* `DEBUG = False`

* `ALLOWED_HOSTS = ['*']`

![setting](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/setting_zpslcajqoro.png)

Una vez hecho lo anterior procedemos a desplegarlo a Heroku.

Tenemos que utilizar una herramienta de integración continua como snap-ci, [aquí](integracion-continua.md#snap-ci) se puede ver como ha de utilizarse

snap-ci se encarga de copiar todos los archivos estáticos para que se muestren correctamente

![snap](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/heroku_zpsiz9mqjp4.png) 

Tras configurar correctamente la integración continua desplegaremos la aplicación a Heroku, para ver como se ha realizado el despliegue podemos consultar este [enlace](despliegue-heroku.md#despliegue-heroku)

