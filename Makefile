.PHONY: all ubuntu kibana


ubuntu:
	docker build -t ubuntu ubuntu

kibana:
	docker build -t xxw_kibana kibana

web: ubuntu
	docker build -t xxw_web web
