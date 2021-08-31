FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt-get install ffmpeg
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN mkdir /app/
WORKDIR /app/
COPY . /app/
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
