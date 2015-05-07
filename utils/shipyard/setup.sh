#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	docker run -d -v /var/run/docker.sock:/var/run/docker.sock shipyard/deploy start
	until [ "$?" -eq 0 ]
	do
		echo "Install Shipyard failed. Retry..."
		docker run -d -v /var/run/docker.sock:/var/run/docker.sock shipyard/deploy start
	done
else
	exit 1
fi
