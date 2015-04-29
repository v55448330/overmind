#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	docker run --name registry -d -p 5000:5000 registry
else
	exit 1
fi
