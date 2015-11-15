clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: clean
	python3 setup.py install
	
test: clean
	python3 manage.py test
	
run:
	python3 manage.py runserver

