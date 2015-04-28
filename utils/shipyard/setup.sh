#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	docker run -d -v /var/run/docker.sock:/var/run/docker.sock shipyard/deploy start
else
	exit 1
fi
