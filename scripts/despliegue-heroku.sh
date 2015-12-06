#!/bin/bash

git clone https://github.com/acasadoquijada/IV.git

cd IV

heroku login

heroku create

git add .

git commit -m "Despliegue"

git push heroku master

heroku run python manage.py syncdb --noinput

heroku ps:scale web=1
