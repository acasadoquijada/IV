###Docker

Lo primero que debemos hacer es crearnos un fichero Dockerfile, este fichero debe en la raíz de la aplicación. En mi caso este es el fichero [Dockerfile](../Dockerfile) que he creado

Una vez creado ahora debemos registrarnos en [docker hub](https://hub.docker.com/), una vez registrados pinchamos en `Create > Create automatic build` y seleccionamos el repositorio de nuestra aplicacion. Con esto nos aseguramos de que cada vez que realicemos un cambio en el repositorio se cree una nueva imagen con dichos cambios

Si hemos configurado correctamente el `dockerfile` nos debe aparecer una pantalla similar

![practica4-1](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%204/practica4-1_zpszewwu9b0.png)

Para descargar la imagen tenemos que ejecutar

`sudo docker pull acasadoquijada/ppe`

Una vez descargada la arrancamos

`sudo docker run -i -t acasadoquijada/ppe /bin/bash`

Nos posicionamos dentro del directorio con `cd IV` y ejecutamos la aplicación con `make run`

Otra opción es ejecutar este [script](../scripts/docker.sh) seguido de `cd IV && make run`

Independientemente de la opción elegida, basta con lanzar la app, obtener su dirección ip y copiarla en el navegador seguida de `:8000`

![practica4-2](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%204/practica4-2_zpsa8yh0krj.png)




