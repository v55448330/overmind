#!/bin/sh
locale-gen
sh -c "echo 'LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8' >> /etc/environment"
apt-get update -y
apt-get upgrade -y
apt-get install -y python-pip

#Install docker
docker --version | grep Docker
if [ "$?" -eq 0 ]; then
	echo "Docker has been installed."
else
	wget -qO- https://get.docker.com/ |sh
	until [ "$?" -eq 0 ]
	do
		wget -qO- https://get.docker.com/ |sh
	done
	sudo usermod -aG docker vagrant
fi

sudo pip install -U docker-compose

cd /home/vagrant/utils/
docker-compose up -d

#Install services
# sh -c /home/vagrant/utils/jenkins/setup_docker.sh
# sh -c /home/vagrant/utils/gogs/setup.sh
# sh -c /home/vagrant/utils/registry/setup.sh
# sh -c /home/vagrant/utils/dockerboard/setup.sh
# sh -c /home/vagrant/utils/taskboard/setup.sh
