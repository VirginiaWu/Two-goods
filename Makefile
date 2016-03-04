.PHONY: all ubuntu kibana elasticsearch


ubuntu:
	docker build -t ubuntu ubuntu

elasticsearch:
	docker build -t xxw_elasticsearch elasticsearch

kibana:
	docker build -t xxw_kibana kibana

web: ubuntu
	docker build -t xxw_web web
