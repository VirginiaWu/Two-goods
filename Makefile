.PHONY: all ubuntu


ubuntu:
	docker build -t ubuntu ubuntu

web: ubuntu
	docker build -t xxw_web web
web_dir:
	cd web && \
	mkdir assets/styles/scss/tmp
	cd web && \
	mkdir assets/styles/scss/tmp/components
	cd web && \
    mkdir .tmp/public/styles/components
run:web_dir
	cd web && \
	node concatAllScss.js
	cd web && \
	node generateComponents.js
	cd web && \
    sh compileScss.sh
	cd web && \
	rm -rf assets/styles/scss/tmp
	cd web && \
    rm -rf assets/styles/scss/tmp/components

