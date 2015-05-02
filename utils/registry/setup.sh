#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	docker run --name registry -d -p 5000:5000 registry
	until [ "$?" -eq 0 ]
	do
		echo "Install registry failed. Retry..."
		docker run --name registry -d -p 5000:5000 registry
	done
else
	echo "Docker should be installed and in right privilledges."
	exit 1
fi
