
RUN cd /
RUN mkdir /ytlive
WORKDIR /ytlive
COPY start.sh /start.sh

#Running Radio Player Bot
CMD ["/bin/bash", "/start.sh"]
