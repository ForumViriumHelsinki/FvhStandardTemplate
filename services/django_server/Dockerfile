# pull official base image
FROM python:3.9-slim-buster

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# copy project
COPY . /app/

# install dependencies
# install system dependencies
RUN apt-get update --fix-missing

RUN apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
    build-essential \
    curl \
    git-core \
    pkg-config \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-virtualenv \
    unzip \
    software-properties-common \
    llvm \
    netcat \
    libpq-dev

# If you need GeoDjango:
# RUN apt-get install -y gdal-bin python-gdal python3-gdal

RUN pip install --upgrade pip
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
