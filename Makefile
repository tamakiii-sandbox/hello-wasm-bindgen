.PHONY: help install dependencies versions build clean
.PHONY: install-deps install-rustup install-wasm-pack

RUSTUP := $(or $(shell which rustup), install-rustup)
WASM_PACK := $(or $(shell which wasm-pack), install-wasm-pack)

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	versions

install-deps: \
	$(RUST_UP) \
	$(WASM_PACK)

dependencies:
	type curl > /dev/null

versions:
	@curl --version | head -n 1
	@wasm-pack --version
	@rustc --version

build:
	cargo build

$(WASM_PACK):
	curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

$(RUSTUP):
	bash -c "sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) -y"

clean:
	rm -rf target
