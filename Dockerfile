FROM ubuntu:14.04
MAINTAINER Alejandro Casado Quijada <acasadoquijada@gmail.com>


RUN sudo apt-get -y update


RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/acasadoquijada/IV.git


RUN sudo apt-get install -y python3-setuptools
RUN sudo apt-get -y install python3-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install3 pip
RUN sudo pip install --upgrade pip

#Instalamos la aplicacion
RUN ls
RUN cd IV/ && ls -l
RUN cd IV/ && cat requirements.txt
RUN cd IV/ && sudo pip install -r requirements.txt

#Realizamos migraciones
RUN cd IV/ && python3 manage.py syncdb --noinput
