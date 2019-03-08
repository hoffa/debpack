FROM debian:stretch

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        dpkg-dev \
        fakeroot \
    && rm -rf /var/lib/apt/lists/*

COPY debpack /usr/local/bin/

ENTRYPOINT ["debpack"]
