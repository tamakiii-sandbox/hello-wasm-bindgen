.PHONY: help install dependencies versions build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	versions \
	build

dependencies:
	type docker-compose > /dev/null

versions:
	@docker-compose --version

build:
	docker-compose build

clean:
	docker-compose down -v
