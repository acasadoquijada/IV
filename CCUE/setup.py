from setuptools import setup

setup(name='CCUE',
	version='0.0.1',
	description='Aplicacion web comparticion informacion universitaria',
	url='https://github.com/acasadoquijada/pollaplication',
	author='Alejandro Casado Quijada',
	author_email='acasadoquijada@gmail.com',
	license='GNU GPL',
	packages=['CCUE'],
	install_requires=['django','wheel'],
	zip_safe=False)
