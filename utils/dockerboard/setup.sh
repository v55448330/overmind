#!/bin/sh
docker --version | grep "Docker version"
if [ "$?" -eq 0 ]; then
	if [ "$(docker ps -a |grep dockerboard)" ]; then
		docker restart dockerboard
	else
		docker pull dockerboard/dockerboard
		until [ "$?" -eq 0 ]
		do
			docker pull dockerboard/dockerboard
		done
		docker run -d -p 8001:8001 -v /var/run/docker.sock:/var/run/docker.sock --name dockerboard  dockerboard/dockerboard
	fi

	if [ "$?" -eq 0 ]; then
		echo "Dockerboard is started success."
		exit 0
	else
		echo "Dockerboard is started failed."
		exit 2
	fi

else
	exit 1
fi
