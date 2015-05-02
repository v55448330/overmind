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
	echo "Docker should be installed and in right privilledges."
	exit 1
fi
