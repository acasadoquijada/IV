###Docker

Lo primero que debemos hacer es crearnos un fichero Dockerfile, este fichero debe en la raíz de la aplicación. En mi caso este es el fichero [Dockerfile](../Dockerfile) que he creado

Una vez creado ahora debemos resgistrarnos en [docker hub](https://hub.docker.com/), una vez registrados pinchamos en `Create > Create automatic build` y seleccionamos el repositorio de nuestra aplicacion

Si hemos configurado correctamente el `dockerfile` nos debe aparecer una pantalla similar

![practica4-1]()

Para descargar la imagen tenemos que ejecutar

`sudo docker pull acasadoquijada/ppe`

Una vez descargada la arrancamos

`sudo docker run -i -t acasadoquijada/ppe /bin/bash`

Nos posicionamos dentro del directorio con `cd IV` y ejecutamos la aplicación con `make run`

![practica4-2]()






