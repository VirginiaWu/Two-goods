FROM ubuntu

WORKDIR /server

ADD ./ /server

RUN ln -s -f /server/run.sh /usr/local/bin/run.sh

RUN chmod +x /usr/local/bin/run.sh

EXPOSE 1337 3000

CMD ["/usr/local/bin/run.sh"]
