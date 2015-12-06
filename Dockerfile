FROM ubuntu:14.04
MAINTAINER Alejandro Casado Quijada <acasadoquijada@gmail.com>


RUN sudo apt-get -y update
RUN sudo apt-get install -y git
RUN sudo git clone https://github.com/acasadoquijada/IV.git
RUN sudo apt-get install -y python-setuptools
RUN sudo apt-get -y install python-dev
RUN sudo apt-get -y install build-essential
RUN sudo apt-get -y install python-psycopg2
RUN sudo apt-get -y install libpq-dev
RUN sudo easy_install pip
RUN sudo pip install --upgrade pip
RUN ls
RUN cd IV/ && ls -l
RUN cd IV/ && cat requirements.txt
RUN cd IV/ && sudo pip3 install -r requirements.txt
RUN cd IV/ && python3 manage.py syncdb --noinput
