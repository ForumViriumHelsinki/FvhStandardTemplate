# Project template for FVH's dockerized apps

The purpose of this experimental project is to create
uniform project layout for Forum Virium Helsinki's 
dockerized simple apps, e.g. Flask endpoints,
Django projects and Python processes.


## Want to learn more?
This template is based on this testdriven.io's
[post](https://testdriven.io/blog/dockerizing-flask-with-postgres-gunicorn-and-nginx).


## Want to use this project?

Fork this project, remove unnecessary directories and parts
from docker-compose files, build images and run containers.
Develop. Run again. Develop. Run. Test. Deploy.


## Development

Rename `.env.dev-sample` to `.env.dev`.

If you want to run python app locally (not in Docker container),
you can activate environment variables running this command:  
`export $(xargs < .env.dev)`


### Python 

Comment out or remove everything but services/python 
from `docker-compose.yml`. It should look like this:
```
version: '3.7'

services:
  python:
    build: ./services/python
    command: python app/main.py
    volumes:
      - ./services/python/:/usr/src/app/
    env_file:
      - ./.env.dev
```

Run first  
`docker-compose up -d --build`  
and then  
`docker-compose up`
and you should see output like this:
```
$ docker-compose up 
Starting fvhstandardtemplate_python_1 ... done
Attaching to fvhstandardtemplate_python_1
python_1  | Hello 0 times!
python_1  | Hello 1 times!
python_1  | Hello 2 times!
python_1  | Hello 3 times!
python_1  | Hello 4 times!
fvhstandardtemplate_python_1 exited with code 0
```


### Django

This doesn't work yet. Django and react_ui are just copied from
https://github.com/ForumViriumHelsinki/DjangoReactApp


### Flask

**Work in progress!** 

Uses the default Flask development server.

1. Rename *.env.dev-sample* to *.env.dev*.
1. Update the environment variables in the *docker-compose.yml* and *.env.dev* files.
1. Build the images and run the containers:

    ```sh
    $ docker-compose up -d --build
    ```

    Test it out at [http://localhost:5000](http://localhost:5000). The "web" folder is mounted into the container and your code changes apply automatically.


### Production

Uses gunicorn + nginx.

1. Rename *.env.prod-sample* to *.env.prod* and *.env.prod.db-sample* to *.env.prod.db*. Update the environment variables.
1. Build the images and run the containers:

    ```sh
    $ docker-compose -f docker-compose.prod.yml up -d --build
    ```

    Test it out at [http://localhost:1337](http://localhost:1337). No mounted folders. To apply changes, the image must be re-built.
