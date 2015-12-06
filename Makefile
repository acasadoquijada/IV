clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: clean
	sudo apt-get update 
	sudo apt-get install -y libmysqlclient-dev
	sudo apt-get install -y python-dev
	sudo apt-get install -y python-pip
	sudo pip install --upgrade pip
	sudo apt-get install python3-setuptools
	sudo easy_install3 pip
	
test: clean
	python3 manage.py test
	
run:
	python3 manage.py runserver

