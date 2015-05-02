#!/bin/sh
which docker
if [ "$?" -eq 0 ]; then
	docker run -d -p 4000:80 mirweb/taskboard
	until [ "$?" -eq 0 ]
	do
		echo "Install TaskBoard failed. Retry..."
		docker run -d -p 4000:80 mirweb/taskboard
	done
else
	echo "Docker should be installed and in right privilledges."
	exit 1
fi
