clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: clean
	sudo apt-get update 
	sudo apt-get install -y libmysqlclient-dev
	sudo apt-get install -y python-dev
	sudo apt-get install -y python-pip
	sudo pip install --upgrade pip
    pip install -r requirements.txt
	
test: clean
	python3 manage.py test
	
run:
	python3 manage.py runserver

