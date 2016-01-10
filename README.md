# Two-goods

### How to install Docker?
```
  $ sudo apt-get update
  $ sudo apt-get install wget
  $ sudo wget -qO- https://get.docker.com/ | sh
  $ sudo groupadd docker
  $ sudo gpasswd -a ${USER} docker
```
### How to install docker-compose?
```
  $ apt-get instal python-pip
  $ pip install docker-compose
```

### How to start up?
```
  $ docker-compose -p xxw up
```

### How to run es test?
```
  $ cd web/
  $ grunt test:back
```

### How to run url test?
Two ways:
```
  $ ./routes.test.sh
```
or
```
  $ cd web/
  $ grunt test:route
```
