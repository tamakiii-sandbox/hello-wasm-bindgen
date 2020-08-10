FROM rust:1.45.2

WORKDIR /usr/hello-wasm-bindgen

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      # software-properties-common \
      curl \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#       nodejs \
#       && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

COPY Makefile /tmp/
RUN make -C /tmp install && rm -rf /tmp/Makefile

RUN echo "source /usr/local/cargo/env" >> ~/.bashrc
