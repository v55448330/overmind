#!/bin/sh
docker --version | grep "Docker version"
if [ "$?" -eq 0 ]; then
	docker pull jenkins
	until [ "$?" -eq 0 ]
	do
		docker pull jenkins
	done
	mkdir /var/jenkins

	docker run --name jenkins -d --restart=always -p 8080:8080 -v /var/jenkins jenkins
	if [ "$?" -eq 0 ]; then
		echo "Jenkins is started success."
		exit 0
	else
		echo "Jenkins is started failed."
		exit 2
	fi

else
	exit 1
fi
