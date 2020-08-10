.PHONY: help install dependencies versions build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	versions

dependencies:
	type curl > /dev/null
	type cargo > /dev/null
	type wasm-pack > /dev/null

build: \
	target \
	pkg

target:
	cargo build --lib

pkg:
	wasm-pack build --out-name index .

clean:
	rm -rf target
