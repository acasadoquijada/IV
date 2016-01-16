#PPE

##Pequeños pueblos españoles

[![GNU](https://img.shields.io/badge/license-GNU%20GPL%20V3-ff69b4.svg)](LICENSE)
[![Build Status](https://travis-ci.org/acasadoquijada/IV.svg?branch=master)](https://travis-ci.org/acasadoquijada/IV)
[![Build Status](https://snap-ci.com/acasadoquijada/IV/branch/master/build_image)](https://snap-ci.com/acasadoquijada/IV/branch/master)
[![Heroku](https://www.herokucdn.com/deploy/button.png)](http://aplicacion-bares.herokuapp.com/bares/)

###Introducción

El proyecto de la asignatura se va a llevar a cabo junto al de la asignatura de desarrollo de aplicaciones para internet (DAI).
He elegido realizar ambos proyectos conjuntamente ya que en DAI realizaremos una aplicación web y el objetivo del proyecto de IV es proporcionar soporte, mediante una infraestructura virtual a dicha aplicación

El proyecto consiste en una aplicación web, creada usando django, para hablar sobre pueblos de nuestro país.

Los pueblos se agrupan en provincias, y estas a su vez en comunidades autónomas.

Podremos hablar sobre restaurantes, monumentos, personajes históricos, sitios de interés... dando nuestra opinión y una valoración. Se incluirá un foro para tratar temas con mayor interés.

Dispondrá de una serie de rankings elaborados a partir de las valoraciones de los usuarios.

El objetivo es dar a conocer pueblos pequeños de nuestra región


###Tests

He elegido elegido el sistema de test porque es una buena forma de realizar tus proyectos, ya que permite probar cada funcionalidad de la aplicación para comprobar que todo funciona tal y como esperamos.

En mi caso django proporciona un fichero denominado `test.py` que está pensado para colocar nuestros test. Para ejecutarlo basta usar `python3 manage.py test datos`

Mi fichero test se puede consultar [aquí](PPE/datos/tests.py)

Este fichero ira cambiando según se añadan nuevas funcionalidades a la aplicación

###Herramienta de construcción

Como herramienta de construcción he creado un fichero Makefile, este fichero facilita el uso de la aplicación a personas sin conocimientos de django y representa una capa de abstracción respecto a los ficheros de instalación, ejecución y de test del proyecto.

Consta de cuatro comandos, `install`, `test` `run` y `clean`

Para usar el fichero basta con ejecutar `make` seguido de cualquiera de las opciones anteriores

###Integración continua
Para un correcto desarrollo de la aplicación tenemos que usar sistemas de integración continua. Estos se encargan de ejecutar una serie de tests establecidos previamente para comprobar que la aplicación responde de forma correcta, esta comprobación se realiza cada vez que el repositorio sufra algún cambio.

He elegido dos sistemas de integración continua, [travis](https://travis-ci.org/) y [snap-ci](https://snap-ci.com/)

Se puede consultar el proceso de configuración de ambos sistemas [aquí](documentacion/integracion-continua.md)


###Despliegue en un PaaS

El PaaS elegido es [Heroku](https://id.heroku.com/), ha sido elegido por su facilidad de uso y funcionalidad.

El enlace de mi aplicación en heroku es el [siguiente](http://pequeniospueblosespanioles.herokuapp.com/)

Se puede consultar el proceso de despliegue [aquí](documentacion/despliegue-heroku.md)

También se ha creado un [script](scripts/despliegue-heroku.sh) que permite descargar la aplicación desde el repositorio y desplegarla en heroku simplemente ejecutándolo


###Entorno de pruebas

Como entorno de pruebas he elegido [docker](https://www.docker.com/) debido a que nos permite el despliegue de aplicaciones en contenedores aislados de la máquina anfitriona.

El enlace a mi imagen es [este](https://hub.docker.com/r/acasadoquijada/ppe/)

Se puede consultar el proceso de creación de la imagen [aquí](documentacion/docker.md)

También se ha creado un [script](scripts/docker.sh) que descarga la imagen de la aplicación y la lanza, no olvidar hacer `cd IV && make run` para lanzar la aplicación


###Fichero de cambios

Se ha añadido un [fichero](documentacion/cambios.md) donde se comentan los cambios mas relevantes entre los diferentes hitos para facilitar la corrección de la práctica.



