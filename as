2015-11-15T08:07:45.642370+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 103, in create
2015-11-15T08:07:45.642360+00:00 app[web.1]:     django.setup()
2015-11-15T08:07:45.642363+00:00 app[web.1]:     app_config = AppConfig.create(entry)
2015-11-15T08:07:45.642364+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 106, in create
2015-11-15T08:07:45.642361+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/__init__.py", line 18, in setup
2015-11-15T08:07:45.642370+00:00 app[web.1]: Traceback (most recent call last):
2015-11-15T08:07:45.642372+00:00 app[web.1]: AttributeError: 'module' object has no attribute 'default_app_config'
2015-11-15T08:07:45.642373+00:00 app[web.1]: During handling of the above exception, another exception occurred:
2015-11-15T08:07:45.642375+00:00 app[web.1]: Traceback (most recent call last):
2015-11-15T08:07:45.642376+00:00 app[web.1]:     worker.init_process()
2015-11-15T08:07:45.580950+00:00 app[web.1]:     __import__(module)
2015-11-15T08:07:45.580952+00:00 app[web.1]:     application = get_wsgi_application()
2015-11-15T08:07:45.580955+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/registry.py", line 85, in populate
2015-11-15T08:07:45.580953+00:00 app[web.1]:     django.setup()
2015-11-15T08:07:45.580954+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/__init__.py", line 18, in setup
2015-11-15T08:07:45.642379+00:00 app[web.1]:     self.callable = self.load()
2015-11-15T08:07:45.580956+00:00 app[web.1]:     app_config = AppConfig.create(entry)
2015-11-15T08:07:45.580958+00:00 app[web.1]:     return cls(entry, module)
2015-11-15T08:07:45.580959+00:00 app[web.1]:     self.path = self._path_from_module(app_module)
2015-11-15T08:07:45.580962+00:00 app[web.1]: django.core.exceptions.ImproperlyConfigured: The app module <module 'datos' (namespace)> has multiple filesystem locations (['/app/datos', '/app/datos']); you must configure this app with an AppConfig subclass with a 'path' class attribute.
2015-11-15T08:07:45.580958+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 40, in __init__
2015-11-15T08:07:45.642376+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/arbiter.py", line 507, in spawn_worker
2015-11-15T08:07:45.580961+00:00 app[web.1]:     "with a 'path' class attribute." % (module, paths))
2015-11-15T08:07:45.580963+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 103, in create
2015-11-15T08:07:45.642374+00:00 app[web.1]: 
2015-11-15T08:07:45.642382+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/util.py", line 355, in import_app
2015-11-15T08:07:45.580960+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 69, in _path_from_module
2015-11-15T08:07:45.580963+00:00 app[web.1]: Traceback (most recent call last):
2015-11-15T08:07:45.642377+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/workers/base.py", line 118, in init_process
2015-11-15T08:07:45.642383+00:00 app[web.1]:     __import__(module)
2015-11-15T08:07:45.642371+00:00 app[web.1]:     entry = module.default_app_config
2015-11-15T08:07:45.642373+00:00 app[web.1]: 
2015-11-15T08:07:45.642378+00:00 app[web.1]:     self.wsgi = self.app.wsgi()
2015-11-15T08:07:45.642378+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/app/base.py", line 67, in wsgi
2015-11-15T08:07:45.642381+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/app/wsgiapp.py", line 52, in load_wsgiapp
2015-11-15T08:07:45.642380+00:00 app[web.1]:     return self.load_wsgiapp()
2015-11-15T08:07:45.642391+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/__init__.py", line 18, in setup
2015-11-15T08:07:45.580965+00:00 app[web.1]: AttributeError: 'module' object has no attribute 'default_app_config'
2015-11-15T08:07:45.580967+00:00 app[web.1]: Traceback (most recent call last):
2015-11-15T08:07:45.580967+00:00 app[web.1]: 
2015-11-15T08:07:45.580968+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/arbiter.py", line 507, in spawn_worker
2015-11-15T08:07:45.642384+00:00 app[web.1]:     application = get_wsgi_application()
2015-11-15T08:07:45.642393+00:00 app[web.1]:     app_config = AppConfig.create(entry)
2015-11-15T08:07:45.580966+00:00 app[web.1]: During handling of the above exception, another exception occurred:
2015-11-15T08:07:45.580973+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/app/wsgiapp.py", line 65, in load
2015-11-15T08:07:45.642380+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/app/wsgiapp.py", line 65, in load
2015-11-15T08:07:45.642391+00:00 app[web.1]:     django.setup()
2015-11-15T08:07:45.642403+00:00 app[web.1]:     self.path = self._path_from_module(app_module)
2015-11-15T08:07:45.642403+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 69, in _path_from_module
2015-11-15T08:07:45.580964+00:00 app[web.1]:     entry = module.default_app_config
2015-11-15T08:07:45.580965+00:00 app[web.1]: 
2015-11-15T08:07:45.580969+00:00 app[web.1]:     worker.init_process()
2015-11-15T08:07:45.580970+00:00 app[web.1]:     self.wsgi = self.app.wsgi()
2015-11-15T08:07:45.642382+00:00 app[web.1]:     return util.import_app(self.app_uri)
2015-11-15T08:07:45.642384+00:00 app[web.1]:   File "/app/PPE/wsgi.py", line 16, in <module>
2015-11-15T08:07:45.642390+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/core/wsgi.py", line 14, in get_wsgi_application
2015-11-15T08:07:45.580976+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/util.py", line 355, in import_app
2015-11-15T08:07:45.642401+00:00 app[web.1]:     return cls(entry, module)
2015-11-15T08:07:45.642392+00:00 app[web.1]:     apps.populate(settings.INSTALLED_APPS)
2015-11-15T08:07:45.642404+00:00 app[web.1]:     "with a 'path' class attribute." % (module, paths))
2015-11-15T08:07:45.580974+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/app/wsgiapp.py", line 52, in load_wsgiapp
2015-11-15T08:07:45.580977+00:00 app[web.1]:     __import__(module)
2015-11-15T08:07:45.580975+00:00 app[web.1]:     return util.import_app(self.app_uri)
2015-11-15T08:07:45.580977+00:00 app[web.1]:   File "/app/PPE/wsgi.py", line 16, in <module>
2015-11-15T08:07:45.642400+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 106, in create
2015-11-15T08:07:45.642656+00:00 app[web.1]: [2015-11-15 08:07:45 +0000] [8] [INFO] Worker exiting (pid: 8)
2015-11-15T08:07:45.642405+00:00 app[web.1]: django.core.exceptions.ImproperlyConfigured: The app module <module 'datos' (namespace)> has multiple filesystem locations (['/app/datos', '/app/datos']); you must configure this app with an AppConfig subclass with a 'path' class attribute.
2015-11-15T08:07:45.642402+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 40, in __init__
2015-11-15T08:07:45.580970+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/workers/base.py", line 118, in init_process
2015-11-15T08:07:45.580978+00:00 app[web.1]:     application = get_wsgi_application()
2015-11-15T08:07:45.642393+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/registry.py", line 85, in populate
2015-11-15T08:07:45.580971+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/gunicorn/app/base.py", line 67, in wsgi
2015-11-15T08:07:45.580979+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/core/wsgi.py", line 14, in get_wsgi_application
2015-11-15T08:07:45.580972+00:00 app[web.1]:     self.callable = self.load()
2015-11-15T08:07:45.580973+00:00 app[web.1]:     return self.load_wsgiapp()
2015-11-15T08:07:45.580980+00:00 app[web.1]:     django.setup()
2015-11-15T08:07:45.580980+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/__init__.py", line 18, in setup
2015-11-15T08:07:45.580982+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/registry.py", line 85, in populate
2015-11-15T08:07:45.580989+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 106, in create
2015-11-15T08:07:45.580981+00:00 app[web.1]:     apps.populate(settings.INSTALLED_APPS)
2015-11-15T08:07:45.580990+00:00 app[web.1]:     return cls(entry, module)
2015-11-15T08:07:45.580983+00:00 app[web.1]:     app_config = AppConfig.create(entry)
2015-11-15T08:07:45.580990+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 40, in __init__
2015-11-15T08:07:45.580991+00:00 app[web.1]:     self.path = self._path_from_module(app_module)
2015-11-15T08:07:45.580992+00:00 app[web.1]:   File "/app/.heroku/python/lib/python3.4/site-packages/django/apps/config.py", line 69, in _path_from_module
2015-11-15T08:07:45.580993+00:00 app[web.1]:     "with a 'path' class attribute." % (module, paths))
2015-11-15T08:07:45.580993+00:00 app[web.1]: django.core.exceptions.ImproperlyConfigured: The app module <module 'datos' (namespace)> has multiple filesystem locations (['/app/datos', '/app/datos']); you must configure this app with an AppConfig subclass with a 'path' class attribute.
2015-11-15T08:07:45.581306+00:00 app[web.1]: [2015-11-15 08:07:45 +0000] [7] [INFO] Worker exiting (pid: 7)
2015-11-15T08:07:45.668038+00:00 app[web.1]: [2015-11-15 08:07:45 +0000] [3] [INFO] Shutting down: Master
2015-11-15T08:07:45.668220+00:00 app[web.1]: [2015-11-15 08:07:45 +0000] [3] [INFO] Reason: Worker failed to boot.
2015-11-15T08:07:46.384599+00:00 heroku[web.1]: State changed from starting to crashed
2015-11-15T08:07:46.363228+00:00 heroku[web.1]: Process exited with status 3
2015-11-15T08:51:46.415688+00:00 heroku[router]: at=error code=H10 desc="App crashed" method=GET path="/" host=pequeniospueblosespanioles.herokuapp.com request_id=b297cb08-8863-4b49-b7dc-262a421ed938 fwd="83.49.147.210" dyno= connect= service= status=503 bytes=
2015-11-15T08:51:46.822431+00:00 heroku[router]: at=error code=H10 desc="App crashed" method=GET path="/favicon.ico" host=pequeniospueblosespanioles.herokuapp.com request_id=428927e6-658b-40bc-95d7-cf15345439fc fwd="83.49.147.210" dyno= connect= service= status=503 bytes=
2015-11-15T08:51:46.991859+00:00 heroku[router]: at=error code=H10 desc="App crashed" method=GET path="/favicon.ico" host=pequeniospueblosespanioles.herokuapp.com request_id=d31748e3-572c-44ac-9c7e-5e6dd5c4a800 fwd="83.49.147.210" dyno= connect= service= status=503 bytes=
2015-11-15T08:54:02.732031+00:00 heroku[router]: at=error code=H10 desc="App crashed" method=GET path="/" host=pequeniospueblosespanioles.herokuapp.com request_id=5db2747a-cf2b-4d32-a27f-3d7de7b9d09e fwd="83.49.147.210" dyno= connect= service= status=503 bytes=
2015-11-15T08:55:03.689422+00:00 heroku[api]: Deploy ea2d751 by alex22alex33@gmail.com
2015-11-15T08:55:03.689422+00:00 heroku[api]: Release v9 created by alex22alex33@gmail.com
2015-11-15T08:55:03.790481+00:00 heroku[web.1]: State changed from crashed to down
2015-11-15T08:55:03.851327+00:00 heroku[slug-compiler]: Slug compilation started
2015-11-15T08:55:03.851337+00:00 heroku[slug-compiler]: Slug compilation finished
