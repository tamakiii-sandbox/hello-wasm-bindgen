FROM rust:1.45.2

WORKDIR /usr/hello-wasm-bindgen

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      npm \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY Makefile /tmp/
RUN make -C /tmp install && rm -rf /tmp/Makefile

RUN echo "source /usr/local/cargo/env" >> ~/.bashrc