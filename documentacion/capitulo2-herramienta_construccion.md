##Herramienta de construcción

Como herramienta de construcción he creado un fichero Makefile, este fichero facilita el uso de la aplicación a personas sin conocimientos de django y representa una capa de abstracción respecto a los ficheros de instalación, ejecución y de test del proyecto.

Consta de cuatro comandos, `install`, `test` `run` y `clean`

Para usar el fichero basta con ejecutar `make` seguido de cualquiera de las opciones anteriores

Mi fichero makefile es [este](../Makefile)