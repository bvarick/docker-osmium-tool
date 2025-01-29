FROM openjdk:latest

LABEL org.opencontainers.image.authors="ben@wisconsinbikefed.org"

ARG OSMOSIS_URL="https://github.com/openstreetmap/osmosis/releases/download/0.49.2/osmosis-0.49.2.tar"
ENV OSMOSIS_URL=$OSMOSIS_URL

RUN set -x \
  && useradd -ms /bin/bash osmosis \
  && mkdir -p /opt/osmosis \
  && curl -L $OSMOSIS_URL | tar x -C /opt/osmosis \
  && ln -s /opt/osmosis/osmosis-0.49.2/bin/osmosis /usr/local/bin/osmosis

USER osmosis
CMD ["osmosis"]
