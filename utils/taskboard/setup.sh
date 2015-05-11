#!/bin/sh
docker --version | grep "Docker version"
if [ "$?" -eq 0 ]; then
	docker pull mirweb/taskboard
	until [ "$?" -eq 0 ]
	do
		docker pull mirweb/taskboard
	done

	docker run --name taskboard -d --restart=always -p 4000:80 mirweb/taskboard
	if [ "$?" -eq 0 ]; then
		echo "TaskBoard is started success."
		exit 0
	else
		echo "TaskBoard is started failed."
		exit 2
	fi

else
	exit 1
fi
