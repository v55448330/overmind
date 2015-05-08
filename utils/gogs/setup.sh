#!/bin/sh
docker --version | grep "Docker version"
if [ "$?" -eq 0 ]; then
	if [ "$(docker ps -a |grep gogs)" ]; then
		docker restart gogs
	else
		docker pull codeskyblue/docker-gogs
		until [ "$?" -eq 0 ]
		do
			docker pull codeskyblue/docker-gogs
		done
		docker run --name=gogs -d -p 3000:3000 -v /var/gogs:/data codeskyblue/docker-gogs
	fi

	if [ "$?" -eq 0 ]; then
		echo "Gogs is started success."
		exit 0
	else
		echo "Gogs is started failed."
		exit 2
	fi

else
	exit 1
fi
