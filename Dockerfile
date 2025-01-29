FROM debian:bookworm

# Adapted from https://github.com/StationA/osmium-tool-docker

LABEL org.opencontainers.image.authors="ben@wisconsinbikefed.org"

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    cmake \
    nlohmann-json3-dev \
    libboost-program-options-dev \
    libbz2-dev \
    zlib1g-dev \
    liblz4-dev \
    libexpat1-dev

RUN mkdir /opt/osmium-tool \
  && cd /opt/osmium-tool \
  && git clone https://github.com/mapbox/protozero \
  && git clone https://github.com/osmcode/libosmium \
  && git clone https://github.com/osmcode/osmium-tool \
  && cd osmium-tool \
  && mkdir build \
  && cd build \
  && cmake .. \
  && make

RUN set -x \
  && useradd -ms /bin/bash osmium-tool \
  && ln -s /opt/osmium-tool/osmium-tool/build/osmium /usr/local/bin/osmium

USER osmium-tool
CMD ["osmium"]