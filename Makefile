.PHONY: help install dependencies versions build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	/usr/local/cargo/bin/wasm-pack \
	versions

dependencies:
	type curl > /dev/null

versions:
	@curl --version | head -n 1
	@wasm-pack --version
	@rustc --version

build:
	cargo build

/usr/local/cargo/bin/wasm-pack:
	curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

clean:
	rm -rf target
