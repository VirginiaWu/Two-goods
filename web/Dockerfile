FROM ubuntu

WORKDIR /server

ADD ./ /server/web

COPY ./run.sh /server/

RUN chmod +x /server/run.sh

EXPOSE 1337 3000

# CMD is based on WORKDIR
CMD ["/server/run.sh"]
