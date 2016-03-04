FROM ubuntu:14.04

RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y curl supervisor ca-certificates ssh-client &&\
    curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash - && \
    apt-get install --yes nodejs && \
    apt-get clean && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*
