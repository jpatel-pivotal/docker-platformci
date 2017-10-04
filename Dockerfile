FROM ubuntu:16.04
MAINTAINER jpatel@pivotal.io
ENV DEBIAN_FRONTEND="noninteractive"
#########################
# Docker ubuntu 16.04 with additions to make ci pipeline easier
# - paramiko
# - postgres
# - npm
# - azure client 
#
# Version 0.1
#########################
RUN apt-get update -y;apt-get install -y --no-install-recommends apt-utils;apt-get -y upgrade; apt-get autoremove ; apt-get clean
RUN apt-get install -y python python-pip python-tk postgresql nodejs-legacy npm vim postfix
RUN apt-get install -y mailutils
RUN pip install --upgrade pip
RUN pip install paramiko
RUN pip install --upgrade google-api-python-client
RUN pip install psycopg2
RUN pip install numpy
RUN pip install pandas-datareader
RUN pip install matplotlib
RUN npm install -g azure-cli
RUN mkdir -p ~/.azure/
RUN echo '{"telemetry":false}' > ~/.azure/telemtry.json
RUN azure config mode arm
