# pull official base image
FROM python:3.8.5-slim-buster

# set working directory
WORKDIR /usr/src/app

# set enviroment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

# install system dependencies
RUN apt-get update \
 && apt-get -y insatall netcat gcc \
 && apt-get clean

# install python dependencies \
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY . .