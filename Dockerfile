FROM python:2 
MAINTAINER Yves Jacolin <yjacolin@free.fr>

ENV VERSION 2016-03-27
ENV BERKELEYDB_LIBDIR=/usr/lib/x86_64-linux-gnu
ENV BERKELEYDB_INCDIR=/usr/include

RUN apt-get update
RUN apt-get install -qqy libpq-dev libgeos-dev libdb-dev
RUN apt-get clean && rm -Rf /var/lib/apt/lists/*

RUN mkdir /tilecloud-chain && mkdir -p /var/sig/tiles && \
    cd /tilecloud-chain && \
    mkdir .build && virtualenv .build/venv && \
    .build/venv/bin/pip install bsddb3 && \
    .build/venv/bin/pip install tilecloud-chain

    
RUN cd /tilecloud-chain/ && .build/venv/bin/pcreate -s tilecloud_chain tilegeneration

COPY config.yaml /tilecloud-chain/

WORKDIR /tilecloud-chain
VOLUME ["/tilecloud-chain", "/var/sig/tiles"]

CMD ["/tilecloud-chain/.build/venv/bin/generate_tiles", "--help"]
ENTRYPOINT ["/tilecloud-chain/.build/venv/bin/generate_tiles"]



