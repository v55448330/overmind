#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	docker run -d -p 4000:80 mirweb/taskboard
	until [ "$?" -eq 0 ]
	do
		docker run -d -p 4000:80 mirweb/taskboard
	done
else
	exit 1
fi
