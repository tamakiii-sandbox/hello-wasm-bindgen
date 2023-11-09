.PHONY: help install dependencies versions build clean

CRATE := webpack-template

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	versions \
	.env

dependencies:
	type docker-compose > /dev/null

versions:
	@docker-compose --version

.env:
	echo "CRATE=$(CRATE)" > $@

build:
	docker-compose build

clean:
	docker-compose down -v
