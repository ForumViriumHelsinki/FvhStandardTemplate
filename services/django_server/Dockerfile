# pull official base image
FROM python:3.8-slim-buster

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy project
COPY . /app/

# install dependencies
RUN pip install pipenv
RUN pipenv install --system

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
