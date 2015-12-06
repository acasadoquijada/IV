####Travis

Lo primero que debemos hacer es crear un fichero `.travis.yml` que lo situaremos en el directorio raíz de la aplicación. En el se le indica a travis que debe hacer cuando se realice algun cambio en la aplicación.

Primero le indicamos el lenguaje a usar y su versión

~~~
language: python
python:
 - "3.4.3"
~~~

Tambien hay que indicarle como instalar la aplicación y ejecutar los test

~~~

install:
 - pip3 install -r requirements.txt

script:
 - python3 manage.py test 


Este es mi fichero `.travis.yml`

~~~

Ahora cada vez que realicemos un `push` se ejecutarán automáticamente los test que tengamos definidos para comprobar que todo funciona correctamente.

Si todo va bien debería salir una salida similar a esta:

![practica2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/practica2_zps7yrt4cjk.png)


####Snap CI

Para usar Snap CI hay que registrarse primero, cosa que se puede hacer con la cuenta de github.

Una vez dentro debemos seleccionar el repositorio de la aplicacion deseada pulsando en +Repository.

![practica2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica3_zpsj9ls4qwd.png)

Para que Snap realice los test hay que indicarselo en un stage, para ello escribimos los comandos necesarios

~~~
pip install -r requirements.txt
python3 manage.py test
~~~

![testsnap](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/testsnap_zpsnkrfsbtb.png)


Ahora tenemos que editar el pipeline añadiendo un nuevo stage indicando nuestra aplicación en heroku

![practica3](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/pracitca4_zpscqwz3u3n.png)

Tras esto, cada vez que hagamos un push a nuestro repositorio, Snap comprobará la aplicación automáticamente

![practica4](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/practica5_zpsgkktabyi.png)










