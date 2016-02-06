##Herramienta de construcción

Como herramienta de construcción he creado un fichero Makefile, este fichero facilita el uso de la aplicación a personas sin conocimientos de django y representa una capa de abstracción respecto a los ficheros de instalación, ejecución y de test del proyecto.

Consta de cuatro comandos, `install`, `test` `run` y `clean`

Para usar el fichero basta con ejecutar `make` seguido de cualquiera de las opciones anteriores

En el caso de `run` es necesario añadir `sudo` delante, ya que usa el puerto 80

Se han añadido nuevos comandos como:

* `deploy_heroku` que se encarga de desplegar la aplicación en Heroku

* `deploy_azure` igual que el anterior, solo que en Azure

Mi fichero makefile es [este](../Makefile)

[capítulo anterior](capitulo1-introduccion.md) [capítulo siguiente](capitulo3-test.md)