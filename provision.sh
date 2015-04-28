#!/bin/sh
locale-gen
sh -c "echo 'LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8' >> /etc/environment"
apt-get update -y
apt-get upgrade -y
apt-get install -y git git-flow docker

#Upgrade docker to latest version and related service
wget -qO- https://get.docker.com/ |sh
until [ "$?" -eq 0 ]
do
	wget -qO- https://get.docker.com/ |sh
done
sudo usermod -aG docker vagrant

docker run --name registry -d -p 5000:5000 registry
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock shipyard/deploy start

sh -c /home/vagrant/drone/jenkins/setup.sh
