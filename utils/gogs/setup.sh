#!/bin/sh
mkdir -p /var/gogs
docker run --name=gogs -d -p 10022:22 -p 3000:3000 -v /var/gogs:/data codeskyblue/docker-gogs