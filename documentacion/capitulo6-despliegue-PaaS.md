##Despliegue en un PaaS

El PaaS elegido es [Heroku](https://id.heroku.com/), ha sido elegido por su facilidad de uso y funcionalidad.

El enlace de mi aplicación en heroku es el [siguiente](http://aplicacion-bares.herokuapp.com/bares/)

También se ha creado un [script](scripts/despliegue-heroku.sh) que permite descargar la aplicación desde el repositorio y desplegarla en heroku simplemente ejecutándolo

##Despliegue heroku

Para configurar el despliegue hay que modificar la aplicación añadiendo una serie de ficheros:

Empezaremos creando `Procfile` este se debe guardar en la raíz de la practica. En mi caso mi fichero `Procfile` contiene:

`web: gunicorn PPE.wsgi --log-file -`

Un archivo llamado `requirements.txt`, aunque esta creado desde el segundo hito hay que añadir contenido, se puede consultar [aquí](../requirements.txt)

En mi caso uso python 3.4.3, por lo que tengo que indicárselo a Heroku, para ello creamos un archivo `runtime.txt` con:
~~~
python-3.4.3
~~~

Una vez realizado esto, vamos a subir la aplicación a Heroku, para ello hay que realizar:

* heroku login

* heroku create

* git push heroku master

Con estos pasos tendremos nuestra aplicación subida a Heroku

![practica1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica1_zpsiyahfadk.png)

Llegados a este punto debemos tener algún sistema de integración continua configurado para que cada vez que actualicemos el repositorio de la aplicacion se realice el despliegue automático, para tal fin he usado [snap-ci](integracion-continua.md#snap-ci)

Una vez que lo tengamos definido, hay que indicarle a heroku que espere a que snap-ci le de el visto bueno para desplegar la aplicación. También le indicamos que se conecte con el repositorio de nuestra aplicación para garantizarnos que al realizar un cambio en él, se realice el despliegue

![heroku](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/heroku_zpswmdusblb.png)

###Configuración postgresql

Para utilizar la base de datos `postgresql` que nos proporciona heroku tenemos que realizar lo siguiente:

Editar el archivo `setting.py` añadiendo

~~~

import dj_database_url

SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

ON_HEROKU = os.environ.get('PORT')
if ON_HEROKU:
DATABASE_URL=' postgres://dyrolofjqyvqcl:FWOtWebQ7WTaGIfkoPXqQvs3NM@ec2-107-21-223-110.compute-1.amazonaws.com:5432/d2s7fpae9snpfo'
DATABASES = {'default': dj_database_url.config(default=DATABASE_URL)}
~~~

Cabe mencionar que `DATABASE_URL` es la URL de nuestra base de datos `postgresql`, para obtenerla tenemos que irnos a `Heroku Postgres :: Database` en el panel de nuestra aplicación y pinchar en `show`

![db-heroku](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%204/bd-heroku_zpsepolfln4.png)

Una vez hecha la configuración, tenemos que sincronizar `sqlite` con `postgresql`, para ello basta ejecutar `heroku run python manage.py syncdb`