FROM ubuntu:14.04
MAINTAINER Alejandro Casado Quijada <acasadoquijada@gmail.com>



RUN sudo apt-get update
RUN sudo apt-get install -y git
RUN sudo apt-get install -y build-essential
RUN sudo git clone https://github.com/acasadoquijada/IV.git
RUN cd IV && git pull
RUN cd IV && make install
