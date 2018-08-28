#!/bin/sh
exec docker run -it \
    --mount "type=bind,src=$(pwd)/debs,dst=/home/packager/deb-export" \
    --mount "type=bind,src=$(pwd)/apt-keys,dst=/home/packager/apt-keys" \
    --entrypoint=/bin/bash ubuntu-deb-build
