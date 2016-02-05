clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: clean
	 pip install -r requirements.txt
	
test: clean
	python3 manage.py test
	
run:
	python3 manage.py runserver 0.0.0.0:80

