Para configurar el despliegue hay que modificar la aplicación añadiendo una serie de ficheros:

Empezaremos creando `Procfile` este se debe guardar en la raiz de la practica. En mi caso mi fichero `Procfile` contiene:

`web: gunicorn PPE.wsgi --log-file -`

Un archivo llamado `requirements.py`, aunque esta creado desde el segundo hito hay que añadir contenido, se puede consultar [aqui](../requirements.py)

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

Llegados a este punto debemos tener algun sistema de integración continua configurado para que cada vez que actualicemos el repositorio de la aplicacion se realice el despliegue automatico, para tal fin he usado [snap-ci](integracion-continua)

Una vez que lo tengamos definido, hay que indicarselo a heroku

![heroku](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica3/heroku_zpswmdusblb.png)


