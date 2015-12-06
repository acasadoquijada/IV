#PPE

##Pequeños pueblos españoles

[![GNU](https://img.shields.io/badge/license-GNU%20GPL%20V3-ff69b4.svg)](LICENSE)
[![Build Status](https://travis-ci.org/acasadoquijada/IV.svg?branch=master)](https://travis-ci.org/acasadoquijada/IV)
[![Build Status](https://snap-ci.com/acasadoquijada/IV/branch/master/build_image)](https://snap-ci.com/acasadoquijada/IV/branch/master)
[![Heroku](https://www.herokucdn.com/deploy/button.png)](http://pequeniospueblosespanioles.herokuapp.com/)

###Introducción

El proyecto de la asignatura se va a llevar a cabo junto al de la asginatura de desarrollo de aplicaciones para internet (DAI).
 
He elegido realizar ambos proyectos conjuntamente ya que en DAI realizaremos una aplicación web y el objetivo del proyecto de IV es proporcionar soporte, mediante una infraestructura virtual a dicha aplicación

El proyecto consiste en una aplicación web, creada usando django, para hablar sobre pueblos de nuestro país.

Los pueblos se agrupan en provincias, y estas a su vez en comunidades autónomas.

Podremos hablar sobre restaurantes, monumentos, personajes históricos, sitios de interes... dando nuestra opinión y una valoración. Se incluirá un foro para tratar temas con mayor interés.

Dispondra de una serie de rankings elaborados a partir de las valoraciones de los usuarios.

El objetivo es dar a conocer pueblos pequeños de nuestra región

###Tests

He elegido elegido el sistema de test porque es una buena forma de realizar tus proyectos, ya que permite probar cada funcionalidad de la aplicación para comprobar que todo funciona tal y como esperamos.

En mi caso django proporciona un fichero denominado `test.py` que está pensado para colocar nuestros test. Para ejecutarlo basta usar `python3 manage.py test datos`

Mi fichero test se puede consultar [aquí](PPE/datos/tests.py)

Este fichero ira cambiando según se añadan nuevas funcionalidades a la aplicación

###Integración continua
  
Para un correcto desarrollo de la aplicación tenemos que usar sistemas de integración continua. Estos se encargan de ejecutar una serie de tests establecidos previamente para comprobar que la aplicación responde de forma correcta, esta comprobacion se realiza cada vez que el respositorio sufra algun cambio.

He elegido dos sistemas de integración continua, [travis](https://travis-ci.org/) y [snap-ci](https://snap-ci.com/)

Se puede consultar el proceso de configuracion de ambos sistemas [aqui](documentacion/integracion-continua.md)



###Desplegando la aplicación en un PaaS

El PaaS elegido es [Heroku](https://id.heroku.com/), ha sido elegido por su facilidad de uso y funcionalidad.

El enlace de mi aplicacion en heroku es el [siguiente](http://pequeniospueblosespanioles.herokuapp.com/)

Se puede consultar el proceso de despliegue [aqui](documentacion/despliegue-heroku.md)



Hay que modificar la aplicación añadiendo una serie de ficheros:

Empezaremos creando `Procfile` este se debe guardar en la raiz de la practica. En mi caso mi fichero `Procfile` contiene:

`web: gunicorn PPE.wsgi --log-file -`

Un archivo llamado `requirements.py`, aunque esta creado desde el segundo hito hay que añadir contenido, por lo que quedaría asi:

~~~
Django==1.8.6
django-toolbelt==0.0.1
djangorestframework==3.3.1
dj-database-url==0.3.0
dj-static==0.0.6
gunicorn==19.3.0
static3==0.6.1
wheel==0.24.0
whitenoise==2.0.4
psycopg2==2.6.1
Pygments==2.0.2
~~~

En mi caso uso python 3.4.3, por lo que tengo que indicarselo a Heroku, para ello creamos un archivo `runtime.txt` con:
~~~
python-3.4.3
~~~

Una vez realizado esto, vamos a subir la aplicación a Heroku, para ello hay que realizar:

* heroku login

* heroku create

* git push heroku master

Con estos pasos tendremos nuestra aplicación subida a Heroku

![practica1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica1_zpsiyahfadk.png)


Ahora podremos acceder a ella a través de la [url](http://pequeniospueblosespanioles.herokuapp.com/) proporcionada por Heroku


Para que los cambios en la aplicación se desplieguen al hacer `git push` debemos hacer lo siguiente:

![heroku](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/heroku_zpswmdusblb.png)


####Configuracion postgresql

Para utilizar la base de datos `postgresql` que nos proporciona heroku tenemos que realizar lo siguiente:

* Editar los archivos `wsgi.py` y `setting.py` añadiendo:

~~~
from dj_static import Cling
application = Cling(get_wsgi_application())

~~~

~~~

import dj_database_url

SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

ON_HEROKU = os.environ.get('PORT')
if ON_HEROKU:
    DATABASE_URL=' postgres://dyrolofjqyvqcl:FWOtWebQ7WTaGIfkoPXqQvs3NM@ec2-107-21-223-110.compute-1.amazonaws.com:5432/d2s7fpae9snpfo'
    DATABASES = {'default': dj_database_url.config(default=DATABASE_URL)}
~~~

Una vez hecha la configuración, tenemos que sincronizar las bases de datos, para ello basta ejecutar `heroku run python manage.py syncdb`















