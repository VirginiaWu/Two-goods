FROM ubuntu:14.04

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y curl supervisor ca-certificates ssh-client &&\
    curl -sL https://deb.nodesource.com/setup_iojs_2.x | bash - &&\
    apt-get install --no-install-recommends -y iojs &&\
    apt-get install --no-install-recommends -y ruby-full && \
    gem install sass && \
    apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*
