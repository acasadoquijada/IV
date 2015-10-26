#CCUE

##Compartición de conocimiento de universidades españolas

##Primer hito

###Introducción

El proyecto de la asignatura se va a llevar a cabo junto al de la asginatura de desarrollo de aplicaciones para internet (DAI).
 
He elegido realizar ambos proyectos conjuntamente ya que en DAI realizaremos una aplicación web y el objetivo del proyecto de IV es proporcionar soporte, mediante una infraestructura virtual a dicha aplicación

El proyecto consiste en una aplicación web, creada usando django, en la que se pueden dar de alta usuarios, universidades, grados y asignaturas.

Cada grado va ligado a una universidad y cada asignatura a un grado.

Será posible compartir apuntes, subiendolos a la aplicación, cada asignatura tendrá su propio foro para posibles debates.

Se está estudiando la posibilidad de agregar profesores a las asignaturas para que los allumnos comententen sobre ellos.

Como era de esperar esta aplicación contrendrá un sistema de moderación, impidiendo que se utilicen palabras inapropiadas en los comentarios.


##Segundo hito

[![Build Status](https://travis-ci.org/acasadoquijada/IV.svg?branch=master)](https://travis-ci.org/acasadoquijada/IV)

###Tests

He elegido elegido el sistema de test porque es una buena forma de realizar tus proyectos, ya que permite probar cada funcionalidad de la aplicación para comprobar que todo funciona tal y como esperamos.

En mi caso django proporciona un fichero denominado `test.py` que está pensado para colocar nuestros test. Para ejecutarlo basta usar `python3 manage.py test datos`

Mi fichero test se puede consultar [aquí](test)

Este fichero ira cambiando según se añadan nuevas funcionalidades a la aplicación

###Integración continua

Para la integración contínua he elegido [travis](https://travis-ci.org/) debido a su facilidad de uso y su correcto funcionamiento.

Necesitamos crear un fichero llamado `[setup.py]`(setup)

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







