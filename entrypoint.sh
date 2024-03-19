#!/usr/bin/env bash

# gunicorn core.asgi:application --user www-data --bind 127.0.0.1:8010 -k uvicorn.workers.UvicornWorker
#gunicorn --config gunicorn-cfg.py core.wsgi

# gunicorn core.wsgi --user www-data --bind 0.0.0.0:8010 --workers
echo "Starting server....!"
# nginx -g "daemon on;"
# gunicorn core.wsgi:application --user www-data --bind 0.0.0.0:8012 -k uvicorn.workers.UvicornWorker
# gunicorn core.wsgi:application --bind 0.0.0.0:8012 --workers=4
python manage.py runserver 0.0.0.0:8000
echo "Started server....!"