#!/bin/sh
locale-gen
sh -c "echo 'LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8' >> /etc/environment"
apt-get update -y
apt-get upgrade -y

#Install docker
wget -qO- https://get.docker.com/ |sh
until [ "$?" -eq 0 ]
do
	wget -qO- https://get.docker.com/ |sh
done
sudo usermod -aG docker vagrant
