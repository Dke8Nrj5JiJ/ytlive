# Python Based Docker
FROM python:latest

RUN apt update && apt upgrade -y

#Installing Requirements
RUN apt install git curl python3-pip ffmpeg -y

#Updating Pip
RUN pip3 install -U pip

#Copying Requirements

RUN cd /
RUN mkdir /ytlive
WORKDIR /ytlive
COPY start.sh /start.sh

#Running Radio Player Bot
CMD ["/bin/bash", "/start.sh"]
