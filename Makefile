clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: clean
	 pip3 install -r requirements.txt
	
test: clean
	python3 manage.py test
	
run:
	python3 manage.py runserver 0.0.0.0:80

deploy_azure:
	cd Vagrant-Azure/
	vagrant box add azure https://github.com/msopentech/vagrant-azure/raw/master/dummy.box
	vagrant up --provider=azure
	vagrant provision
	#@./scripts/hola.sh
