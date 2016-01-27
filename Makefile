.PHONY: all ubuntu


ubuntu:
	docker build -t ubuntu ubuntu

web: ubuntu
	docker build -t xxw_web web