#Bares

##Aplicación web sobre bares

[![GNU](https://img.shields.io/badge/license-GNU%20GPL%20V3-ff69b4.svg)](LICENSE)
[![Build Status](https://travis-ci.org/acasadoquijada/IV.svg?branch=master)](https://travis-ci.org/acasadoquijada/IV)
[![Build Status](https://snap-ci.com/acasadoquijada/IV/branch/master/build_image)](https://snap-ci.com/acasadoquijada/IV/branch/master)
[![Heroku](https://www.herokucdn.com/deploy/button.png)](http://aplicacion-bares.herokuapp.com/bares/)

###Introducción

El proyecto de la asignatura se va a llevar a cabo junto al de la asignatura de desarrollo de aplicaciones para internet (DAI).
He elegido realizar ambos proyectos conjuntamente ya que en DAI realizaremos una aplicación web y el objetivo del proyecto de IV es proporcionar soporte, mediante una infraestructura virtual a dicha aplicación

El proyecto consiste en una aplicación web, creada usando django, sobre bares. Cada bar tiene asociado una serie de tapas que pueden ser añadidas por cualquier cliente registrado.

Cada bar tambien cuenta con su dirección mostrada usando google maps. La página de inicio cuenta ademas con un gráfico de los bares mas populares, para determinar la popularidad de un bar nos basamos en sus visitas.

Como curiosidad la aplicación cuenta con 3 botones para aumentar, disminuir y resetear el tamaño de la letra.

Nota: En los distintos procesos de configuración realizados durante este proyecto aparecen imágenes de dicha configuración de otra aplicación, PPE, esto se debe a que en un principio se comenzó a trabajar sobre ella pero se desecho por la aplicación actual, bares. Cabe destacar que las configuraciones de ambas aplicaciones son idénticas, por eso no se han vuelto a realizar las capturas de pantalla


###Tests

He elegido elegido el sistema de test porque es una buena forma de realizar tus proyectos, ya que permite probar cada funcionalidad de la aplicación para comprobar que todo funciona tal y como esperamos.

En mi caso django proporciona un fichero denominado `test.py` que está pensado para colocar nuestros test. Para ejecutarlo basta usar `python3 manage.py test datos`

Mi fichero test se puede consultar [aquí](bares/tests.py)

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

El enlace de mi aplicación en heroku es el [siguiente](http://aplicacion-bares.herokuapp.com/bares/)

Se puede consultar el proceso de despliegue [aquí](documentacion/despliegue-heroku.md)

[Aquí](documentacion/despliegue-dai.md) Se puede consultar tambien el despliegue explicado para la asignatura DAI

También se ha creado un [script](scripts/despliegue-heroku.sh) que permite descargar la aplicación desde el repositorio y desplegarla en heroku simplemente ejecutándolo


###Entorno de pruebas

Como entorno de pruebas he elegido [docker](https://www.docker.com/) debido a que nos permite el despliegue de aplicaciones en contenedores aislados de la máquina anfitriona.

El enlace a mi imagen es [este](https://hub.docker.com/r/acasadoquijada/bares/)

Se puede consultar el proceso de creación de la imagen [aquí](documentacion/docker.md)

También se ha creado un [script](scripts/docker.sh) que descarga la imagen de la aplicación y la lanza, no olvidar hacer `cd IV && make run` para lanzar la aplicación


###Fichero de cambios

Se ha añadido un [fichero](documentacion/cambios.md) donde se comentan los cambios mas relevantes entre los diferentes hitos para facilitar la corrección de la práctica.

