.PHONY: help install dependencies versions build build-dev clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	versions \
	node_modules

dependencies:
	type npm > /dev/null
	type npx > /dev/null
	type node > /dev/null

node_modules:
	npm install --dev

versions:
	@npm --version
	@npx --version
	@node --version

build:
	npx --no-install webpack

build-dev:
	npx --no-install webpack-dev-server --host 0.0.0.0 --port 8080 -d

clean:
	rm -rf node_modules
