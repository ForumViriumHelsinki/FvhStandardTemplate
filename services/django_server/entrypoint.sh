#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $POSTGRESQL_HOST $POSTGRESQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# pipenv install --system
pip install -r requirements.txt
python manage.py migrate
# python manage.py collectstatic --no-input --clear

exec "$@"
