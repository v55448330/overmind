#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	mkdir -p /var/gogs
	docker run --name=gogs -d -p 3000:3000 -v /var/gogs:/data codeskyblue/docker-gogs
	until [ "$?" -eq 0 ]
	do
		docker run --name=gogs -d -p 3000:3000 -v /var/gogs:/data codeskyblue/docker-gogs
	done
else
	exit 1
fi
