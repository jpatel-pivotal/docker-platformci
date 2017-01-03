FROM ubuntu:16.04
MAINTAINER jpatel@pivotal.io

#########################
# Docker ubuntu 16.04 with additions to make ci pipeline easier
# - paramiko
# - postgres
# - npm
# - azure client 
#
# Version 0.1
#########################
RUN apt-get update -y;apt-get -y upgrade; apt-get autoremove ; apt-get clean
RUN apt-get install -y python python-pip postgresql nodejs-legacy npm vim
RUN pip install paramiko
RUN pip install --upgrade google-api-python-client
RUN npm install -g azure-cli
RUN mkdir -p ~/.azure/
RUN echo '{"telemetry":false}' > ~/.azure/telemtry.json
RUN azure config mode arm
