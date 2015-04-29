#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	docker run --name registry -d -p 5000:5000 registry
	until [ "$?" -eq 0 ]
	do
		docker run --name registry -d -p 5000:5000 registry
	done
else
	exit 1
fi
