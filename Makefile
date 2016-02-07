clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: clean
	 pip3 install -r requirements.txt
	
test: clean
	python3 manage.py test
	
run:
	nohup python3 manage.py runserver 0.0.0.0:80
	
deploy_heroku:
	@cd scripts/ && ./despliegue-heroku.sh

deploy_azure:
	@cd Vagrant/ && ./azure.sh

