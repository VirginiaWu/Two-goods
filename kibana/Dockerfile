FROM ubuntu
ENV KIBANA_VERSION 4.4.0-linux-x64

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget ca-certificates
RUN wget https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz -O /tmp/kibana.tar.gz && \
    mkdir -p /app && \
    tar zxf /tmp/kibana.tar.gz && mv kibana-${KIBANA_VERSION}/* /app


ADD kibana.yml /app/config/kibana.yml

EXPOSE 80

CMD ["/app/bin/kibana"]
