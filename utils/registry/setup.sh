#!/bin/sh
docker --version | grep "Docker version"
if [ "$?" -eq 0 ]; then
	docker pull registry
	until [ "$?" -eq 0 ]
	do
		docker pull registry
	done

	docker run --name registry -d --restart=always -p 5000:5000 registry
	if [ "$?" -eq 0 ]; then
		echo "Docker registry is started success."
		exit 0
	else
		echo "Docker registry is started failed."
		exit 2
	fi

else
	exit 1
fi
