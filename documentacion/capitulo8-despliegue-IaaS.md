##Despliegue IaaS

En mi caso el IaaS elegido ha sido azure. Para realizar el despliegue vamos a usar Ansible y Vagrant. 

El fichero makefile cuenta con una opción para desplegar la app, `make deploy_azure` pero el proceso de certificados/acreditaciones debe hacerse manualmente.

[![Azure](http://azuredeploy.net/deploybutton.png)](http://appbares.cloudapp.net/bares/)

Nota: La máquina puede estar parada para ahorrar crédito
###Ansible

Lo primero que debemos hacer es crear un fichero `.yml`, el mio se llama `aprovisionamiento.yml` cuyo contenido es:

~~~
- hosts: localhost
  sudo: yes
  remote_user: vagrant
  tasks: 
  - name: Actualizamos sistema
    apt: update_cache=yes
  - name: Instalamos los paquetes necesarios
    apt: name=python3-setuptools state=present
    apt: name=python3-dev state=present 
    apt: name=build-essential state=present
    apt: name=python3-pip state=present
    apt: name=git state=present
  - name: Instalamos pip para python3
    action: apt pkg=python3-pip  
  - name: Instalamos postgresql
    command: sudo easy_install3 pip
    command: sudo apt-get install -y python-dev libpq-dev python-psycopg2
  - name: Descargamos la aplicacion
    git: repo=https://github.com/acasadoquijada/IV.git  dest=proyectoIV clone=yes force=yes
  - name: Damos permisos de ejecución a la app
    command: chmod -R +x proyectoIV
  - name: Instalamos la app
    shell: cd proyectoIV && make install
  - name: Ejecutamos la app
    shell: cd proyectoIV && make run
~~~

En este fichero indicamos los paquetes a instalar necesarios para la app, tambien indicamos que se descargue la aplicación, se instale y se ejecute.

Con host `remote_user:` establecemos el nombre del usuario de la máquina

Ahora debemos crear un fichero llamado `ansible_hosts` con lo siguiente

~~~
[localhost]
192.168.10.175
~~~

La ip es la ip privada de la máquina de azure que se creará con Vagrant

###Vagrant

Una vez realizados los preparativos de ansible, procedemos con Vagrant para crear la máquina en Azure.

Como no he usado Azure antes tengo que instalar el software necesario

* sudo apt-get install nodejs-legacy
* sudo apt-get install npm
* sudo npm install -g azure-cli

Tambien tenemos que instalar el plugin de Azure para Vagrant

`vagrant plugin install vagrant-azure`

Tras instalar todo lo necesario, obtenemos nuestros credenciales de Azure

* azure login
* azure account download

Al ejecutar los comandos nos pedira que visitemos unas webs, introduzcamos un codigo y descarguemos las credenciales.

Para importarlas a Azure usamos

`azure account import Free\ Trial-2-5-2016-credentials.publishsettings`

![credenciales](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%205/credenciales_zpsfgkdjyqk.png)

Lo siguiente que debemos hacer es subir nuestros certificados a Azure, primero hay que generarlos:

* `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout azurevagrant.key -out azurevagrant.key`  
* `chmod 600 azurevagrant.key`
* `openssl x509 -inform pem -in azurevagrant.key -outform der -out azurevagrant.cer`

Una vez generados, los subimos, para ello accedemos a esta [direccion](https://manage.windowsazure.com)

![certificado](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/certificado_zps7s1pnop9.png)

Para terminar la configuración de Vagrant con Azure hay que generar un `.pem`

* `openssl req -x509 -key ~/.ssh/id_rsa -nodes -days 365 -newkey rsa:2048 -out azurevagrant.pem`

* `cat azurevagrant.key > azurevagrant.pem`

Tras terminar toda la configuración de Vagrant y Azure, creamos un fichero `Vagrantfile`

~~~
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.vm.box = 'azure'
  config.vm.network "public_network"
  config.vm.network "private_network",ip: "192.168.10.175", virtualbox__intnet: "vboxnet0"
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.define "localhost" do |l|
          l.vm.hostname = "localhost"
  end
   
  config.vm.provider :azure do |azure, override|
      azure.mgmt_certificate = File.expand_path('/home/alejandro/azure/azurevagrant.pem') 
      azure.mgmt_endpoint = 'https://management.core.windows.net'
      azure.subscription_id = '6f02263d-1401-4a4c-8cc9-88bf3d4b9877'
      azure.vm_image = 'b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-14_04_2-LTS-amd64-server-20150506-en-us-30GB'
      azure.vm_name = 'maquina-iv' 
      azure.vm_password = 'MiClave27'
      azure.vm_location = 'Central US' 
      azure.ssh_port = '22'
      azure.tcp_endpoints = '80:80'
  end
  
  config.vm.provision "ansible" do |ansible|
      ansible.sudo = true
        ansible.playbook = "aprovisionamiento.yml"
        ansible.verbose = "v"
        ansible.host_key_checking = false
  end

end  
~~~

Se puede ver que este fichero esta dividido en tres bloques.

El primer bloque indicamos que el nombre de la maquina a usar es azure, con ip privada indicada por nosotros, es la misma ip que la que es encuentra en el fichero `ansible_hosts`. Tambien tenemos que indicar donde se encuentra nuestro certicifado `.pem`, colocar nuestro id de azure, este id se puede encontrar en el mismo lugar donde subimos nuestras credenciales. Por ultimo se le indica la imagen a usar, un ubuntu server 14_04

En el segundo bloque establecemos parametros de la maquina, como su nombre, contraseña, localizacion, puerto de ssh y endpoints, muy importantes, ya que sin ellos no se puede acceder a la maquina desde fuera.

En el ultimo bloque indicamos que el aprovisionamiento se va a realizar con ansible, el fichero de aprovisionamiento a usar y que queremos opciones de depuracion.

Tras redactar correctamente el Vagrantfile, realizamos

* `vagrant box add azure https://github.com/msopentech/vagrant-azure/raw/master/dummy.box`


Finalmente ya podemos levantar nuestra máquina con 

* `vagrant up --provider=azure`

![vagrant-up](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/vagrant-up_zpsatf5knak.png)


Si no se aprovisiona automáticamente, usar

* `vagrant provision`

![vagrant-provision](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/vagrant-provider_zpsi3dvxw1c.png
)


Para lanzar la aplicación dispongo de un fichero [fabfile.py](../fabfile.py) con una opción para ello

`fab -H vagrant@appbares.cloudapp.net ejecutarApp`

![azure](http://i1045.photobucket.com/albums/b460/Alejandro_Casado/Practica%205/azure_zpsr17nilza.png)





[capítulo anterior](capitulo7-despliegue-PaaS.md)






