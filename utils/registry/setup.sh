#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	docker run --name registry -d -e STORAGE_PATH=/home/vagarnt/share/registry -p 5000:5000 registry
else
	exit 1
fi
