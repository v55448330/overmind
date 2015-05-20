#!/bin/sh
locale-gen
sh -c "echo 'LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8' >> /etc/environment"
apt-get update -y
apt-get upgrade -y
apt-get install -y git python-setuptools
easy_install -U pip

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

su - vagrant
rm -rf overmind
git clone https://github.com/wizardbyron/overmind.git
cd overmind
docker-compose up -d
