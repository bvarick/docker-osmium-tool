# Osmosis for Docker

Osmosis docker image (forked from the [YAGA Development-Team](https://yagajs.org))

## What is Osmosis

[Osmosis](http://wiki.openstreetmap.org/wiki/Osmosis) is a command line Java application for processing OSM data. The
tool consists of pluggable components that can be chained to perform a larger operation. For example, it has components
for reading/writing databases and files, deriving/applying changes to data sources, and sorting data, (etc.). It has
been written to easily add new features without re-writing common tasks such as file and database handling.

## Run container

The container just ships osmosis and is not able to run without any additional commands.

Here are some examples how you can use this image *(For more information visit the 
[detailed usage page of the osmosis project](http://wiki.openstreetmap.org/wiki/Osmosis/Detailed_Usage_0.45))*:

You can build the image with a command like this: `docker build -t osmosis .`

You can run the container with a command like this:

```bash
# Import from and export to osm-xml
docker run -v /absolute/path/to/osm-data:/osm-data osmosis osmosis --read-xml file="/osm-data/planetin.osm" --write-xml file="/osm-data/planetout.osm"

# Import from pbf export to osm-xml
docker run -v /absolute/path/to/osm-data:/osm-data osmosis osmosis --read-pbf "/osm-data/planetin.osm.pbf" --write-xml file="/osm-data/planetout.osm"
```

The container is bundled into the [official openJDK](https://hub.docker.com/_/openjdk/) image and pre-configured to work
with Postgis. For best experience, we recommend to use the [YAGA Postgis](https://hub.docker.com/r/yagajs/postgis/)
image.
