clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: clean
	sudo pip3 install -r requirements.txt
	
test: clean
	python3 manage.py test
	
run:
	python3 manage.py runserver

