clean:
	- rm -rf *~*
	- find . -name '*.pyc' -exec rm {} \;

install: clean
	python3 setup.py install
	
test: clean
	python3 manage.py test
	
run:
	python3 manage.py runserver

deploy:
	wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh   # descargar herramienta heroku CLI
	heroku login
	heroku create
	git add .
	git commit -m "Despliege"
	git push heroku master
