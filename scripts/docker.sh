#!/bin/bash

#Tras ejecutar el script no olvidar de ejecutar "cd IV && make run"

#Descarga la imagen
sudo docker pull acasadoquijada/ppe
#Ejecuta la imagen
sudo docker run -i -t acasadoquijada/ppe /bin/bash 


