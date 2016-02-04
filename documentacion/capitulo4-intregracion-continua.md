##Integración continua

Para un correcto desarrollo de la aplicación tenemos que usar sistemas de integración continua. Estos se encargan de ejecutar una serie de tests establecidos previamente para comprobar que la aplicación responde de forma correcta, esta comprobación se realiza cada vez que el repositorio sufra algún cambio.

He elegido dos sistemas de integración continua, [travis](https://travis-ci.org/) y [snap-ci](https://snap-ci.com/)

###Travis

[![Build Status](https://travis-ci.org/acasadoquijada/IV.svg?branch=master)](https://travis-ci.org/acasadoquijada/IV)

Lo primero que debemos hacer es crear un fichero `.travis.yml` que lo situaremos en el directorio raíz de la aplicación. En el se le indica a travis que debe hacer cuando se realice algún cambio en la aplicación.

Primero le indicamos el lenguaje a usar y su versión

~~~
language: python
python:
- "3.4.3"
~~~

También hay que indicarle como instalar la aplicación y ejecutar los test

~~~

install:
- make install

script:
- make test 

~~~

Ahora cada vez que realicemos un `push` se ejecutarán automáticamente los test que tengamos definidos para comprobar que todo funciona correctamente.

Si todo va bien debería salir una salida similar a esta:

![practica2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/practica2_zps7yrt4cjk.png)


###Snap-CI

[![Build Status](https://snap-ci.com/acasadoquijada/IV/branch/master/build_image)](https://snap-ci.com/acasadoquijada/IV/branch/master)

Para usar Snap CI hay que registrarse primero, cosa que se puede hacer con la cuenta de github.

Una vez dentro debemos seleccionar el repositorio de la aplicacion deseada pulsando en +Repository.

![practica2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica3_zpsj9ls4qwd.png)

Para que Snap realice los test hay que indicárselo en un stage, para ello escribimos los comandos necesarios

~~~
pip install -r requirements.txt
python3 manage.py test
~~~

![testsnap](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/testsnap_zpsnkrfsbtb.png)


Debemos configurar un nuevo pipeline para que snap compruebe que el despliegue en Heroku de nuestra aplicacion se realiza de forma correcta

![practica3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/pracitca4_zpscqwz3u3n.png)

Tras esto, cada vez que hagamos un push a nuestro repositorio, Snap comprobará todo lo comentado arriba automáticamente

![practica4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica5_zpsgkktabyi.png)