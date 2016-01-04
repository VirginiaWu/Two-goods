#FROM jeanblanchard/busybox-java:8

FROM java:8-jre

# grab gosu for easy step-down from roo
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN arch="$(dpkg --print-architecture)" \
  && set -x \
  && curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch" \
  && curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch.asc" \
  && gpg --verify /usr/local/bin/gosu.asc \
  && rm /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4

ENV ELASTICSEARCH_MAJOR 2.1
ENV ELASTICSEARCH_VERSION 2.1.0
ENV ELASTICSEARCH_REPO_BASE http://packages.elasticsearch.org/elasticsearch/2.x/debian

RUN echo "deb $ELASTICSEARCH_REPO_BASE stable main" > /etc/apt/sources.list.d/elasticsearch.list

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends elasticsearch=$ELASTICSEARCH_VERSION \
  && rm -rf /var/lib/apt/lists/*

RUN mv /usr/share/elasticsearch /elasticsearch

ENV PATH /elasticsearch/bin:$PATH

RUN set -ex \
  && for path in \
    /data/elasticsearch/data \
    /data/elasticsearch/logs \
    /elasticsearch/config \
    /elasticsearch/config/scripts \
  ; do \
    mkdir -p "$path"; \
    chown -R elasticsearch:elasticsearch "$path"; \
  done

COPY config /elasticsearch/config

VOLUME ["/data"]

WORKDIR /data

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

RUN  /elasticsearch/bin/plugin install mobz/elasticsearch-head
RUN /elasticsearch/bin/plugin install delete-by-query
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9200 9300

CMD ["elasticsearch"]
