#PPE

##Pequeños pueblos españoles

##Primer hito

###Introducción

El proyecto de la asignatura se va a llevar a cabo junto al de la asginatura de desarrollo de aplicaciones para internet (DAI).
 
He elegido realizar ambos proyectos conjuntamente ya que en DAI realizaremos una aplicación web y el objetivo del proyecto de IV es proporcionar soporte, mediante una infraestructura virtual a dicha aplicación

El proyecto consiste en una aplicación web, creada usando django, para hablar sobre pueblos de nuestro país.

Los pueblos se agrupan en provincias, y estas a su vez en comunidades autónomas.

Podremos hablar sobre restaurantes, monumentos, personajes históricos, sitios de interes... dando nuestra opinión y una valoración. Se incluirá un foro para tratar temas con mayor interés.

Dispondra de una serie de rankings elaborados a partir de las valoraciones de los usuarios.

El objetivo es dar a conocer pueblos pequeños de nuestra región


##Segundo hito

[![Build Status](https://travis-ci.org/acasadoquijada/IV.svg?branch=master)](https://travis-ci.org/acasadoquijada/IV)

###Tests

He elegido elegido el sistema de test porque es una buena forma de realizar tus proyectos, ya que permite probar cada funcionalidad de la aplicación para comprobar que todo funciona tal y como esperamos.

En mi caso django proporciona un fichero denominado `test.py` que está pensado para colocar nuestros test. Para ejecutarlo basta usar `python3 manage.py test datos`

Mi fichero test se puede consultar [aquí](CCUE/datos/tests.py)

Este fichero ira cambiando según se añadan nuevas funcionalidades a la aplicación

###Integración continua

Para la integración contínua he elegido [travis](https://travis-ci.org/) debido a su facilidad de uso y su correcto funcionamiento.

Necesitamos crear un fichero llamado [setup.py](CCUE/setup.py)

Tambien necesitamos crear un fichero `.travis.yml` que lo situaremos en el directorio raíz de la aplicación.

Este es mi fichero `.travis.yml`

~~~
language: python
python:
 - "3.4.3"
# command to install dependencies
install:
 - python CCEU/setup.py install
 - pip install -r CCEU/requirements.txt
# command to run tests
script:
 - cd CCEU
 - python manage.py test
~~~

Ahora cada vez que realicemos un `push` se ejecutarán automáticamente los test que tengamos definidos para comprobar que todo funciona correctamente.

Si todo va bien debería salir una salida similar a esta:

![practica2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%202/practica2_zpszqmff4qp.png)






