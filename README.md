#PPE

##Pequeños pueblos españoles

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

Para la integración contínua he elegido [travis](https://travis-ci.org/) debido a su facilidad de uso y su correcto funcionamiento.

Necesitamos crear un fichero llamado [setup.py](PPE/setup.py)

Para facilitar la instalación y prueba de test de la aplicación he creado un fichero [Makefile](PPE/Makefile)

Para ejecutar la aplicación usando el fichero Makefile basta usar `make run` para los test `make test` y para la instalación `make install`

Tambien necesitamos crear un fichero `.travis.yml` que lo situaremos en el directorio raíz de la aplicación.

Este es mi fichero `.travis.yml`

~~~
language: python
python:
 - "3.4.3"
# Antes de instalar nos posicionamos en el directorio
before_install:
- cd PPE

# Para instalar usamos el fichero Makefile
install:
 - make install

# Tambien usamos Makefile para los test
script:
 - make test
~~~

Ahora cada vez que realicemos un `push` se ejecutarán automáticamente los test que tengamos definidos para comprobar que todo funciona correctamente.

Si todo va bien debería salir una salida similar a esta:

![practica2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/practica2_zps7yrt4cjk.png)


###Desplegando la aplicación en un PaaS

El PaaS elegido es [Heroku](https://id.heroku.com/), ha sido elegido por su facilidad de uso y funcionalidad.

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


###Snap CI

Para usar Snap CI hay que registrarse primero, cosa que se puede hacer con la cuenta de github.

Una vez dentro debemos seleccionar el repositorio de la aplicacion deseada pulsando en +Repository.

![practica2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica3_zpsj9ls4qwd.png)

Para que Snap realice los test hay que indicarselo en un stage, para ello escribimos los comandos necesarios

~~~
pip install -r requirements.txt
make test
~~~

![testsnap]()


Ahora tenemos que editar el pipeline añadiendo un nuevo stage indicando nuestra aplicación en heroku

![practica3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/pracitca4_zpscqwz3u3n.png)

Tras esto, cada vez que hagamos un push a nuestro repositorio, Snap comprobará la aplicación automáticamente

![practica4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica5_zpsgkktabyi.png)

