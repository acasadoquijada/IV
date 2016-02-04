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

Además de los tests, travis puede realizar el despliegue automático de nuetra app en Heroku, para ello debemos modificar nuestro fichero `.travis.yml` añadiendo lo siguiente:

~~~
deploy:
  provider: heroku
  api_key:
    secure: Hdd30jsUrQyFk1rgXQUHZ98DTvL5B95lfJBJKUETstklfKTf7Ae5HOqnAa44M8ILWMp+UDQqKvl/Kli+GrJSQC9HkH4UGzerWliJEjEaulaTK8zomhRe/FH7RdHF3ooiksRsht8DUumKVXva4bM6/kZ9cPTZ/dsHLSqfw6lbKyKw9uJLw19gQ9Qa7qp+LxSPTxvXKPcrkDjL8TDaxntI7RzenPyAO4eSJKQL8u1pixQUCCQDAwAvdT+Guc1eZK82tP0L6PnuFlt8ebILO0pa4lxj47/HTsvrfbJNIlvdHdiASXWLrclEeONVnVNMEpZGqccKFT2EZNzZaaexmcrYgqoc8OCmgM922W9nYxO9Y9mo9TQ6zUtObvAjy4vmyyynKPuZdzQQKdU649S4BMffqScb/g7BVjlhR6R88oXX589a8HrXpNSlvTltnKEbym+fNk2OBr6b4PsSSJ1AMa0WnO+fTCOGSbukXj23RWECvSZC58GNbxAaNmtWJhZVXjxxw5qQWSuBpffLoURpXjqpxaTIsI+rKWkrDseW6ZZZ7SfOWoYRosI8W17aGMmx3qHZt1pvFAuNtCfnLSsoNNg1wjx4s/1DVBxK7+uBfK6/tRaUYiakSBLXClKrPG+4wmrbo1kGPtNYhN2NKs4eH1j1uV5X8Law+KGxFGKNFKZRFvc=
  app: aplicacion-bares
~~~

Con `deploy` le indicamos que queremos el despliegue, con `provider` donde se va a realizar el despliegue.

`api_key` es el resultado de ejecutar `travis encrypt $(heroku auth:token) --add deploy.api_key`, para esto último necesitamos tener instalados los clientes de lienas de comandos de heroku y travis.

Usamos `app` para indicar que la aplicación se va a desplegar en una app de heroku con un nombre distinto al del repositorio.

Una vez configurado todo, cada vez que realicemos un push a nuestro repositorio aparecerá lo siguiente:

![travis](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%202/travis_zpscs75iwyd.png)

Nota: También se explica el proceso de integración continua con snap-ci pero solo se ha realizado con travis para esta aplicación



###Snap-CI

[![Build Status](https://snap-ci.com/acasadoquijada/IV/branch/master/build_image)](https://snap-ci.com/acasadoquijada/IV/branch/master)

Para usar Snap CI hay que registrarse primero, cosa que se puede hacer con la cuenta de github.

Una vez dentro debemos seleccionar el repositorio de la aplicacion deseada pulsando en +Repository.

![practica2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica3_zpsj9ls4qwd.png)

Para que Snap realice los test hay que indicárselo en un stage, para ello escribimos los comandos necesarios

~~~
make install
make test
~~~

![testsnap](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/testsnap_zpsnkrfsbtb.png)


Debemos configurar un nuevo pipeline para que snap compruebe que el despliegue en Heroku de nuestra aplicacion se realiza de forma correcta

![practica3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/pracitca4_zpscqwz3u3n.png)

Tras esto, cada vez que hagamos un push a nuestro repositorio, Snap comprobará todo lo comentado arriba automáticamente

![practica4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica5_zpsgkktabyi.png)


[capítulo anterior](capitulo4-puesta-produccion.md) [capítulo siguiente](capitulo6-entorno-pruebas.md)


