#!/bin/sh
#Install Jenkins
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -y
apt-get -y install jenkins

#Initialize Jenkins by new settings
cp /home/vagrant/drone/jenkins/jenkins_cfg /etc/default/jenkins
service jenkins start

WAITTING_TIME=0
until [ "$(curl --silent --head --location --output /dev/null --write-out '%{http_code}' http://localhost:9090/|grep 200)" ]
do
	sleep 5s
	WAITTING_TIME=$(($WAITTING_TIME+5))
	echo "Waiting Jenkins started up... $WAITTING_TIME seconds";
done

#Update default plugins
cd /var/lib/jenkins/plugins
for name in `ls *.jpi|cut -d "." -f1`; do
  LINK="wget http://updates.jenkins-ci.org/latest/$name.hpi"
  $LINK
done

#Install new plugins
wget http://updates.jenkins-ci.org/latest/credentials.hpi
wget http://updates.jenkins-ci.org/latest/dashboard-view.hpi
wget http://updates.jenkins-ci.org/latest/git-client.hpi
wget http://updates.jenkins-ci.org/latest/git-parameter.hpi
wget http://updates.jenkins-ci.org/latest/git-server.hpi
wget http://updates.jenkins-ci.org/latest/git-userContent.hpi
wget http://updates.jenkins-ci.org/latest/git.hpi
wget http://updates.jenkins-ci.org/latest/greenballs.hpi
wget http://updates.jenkins-ci.org/latest/mailer.hpi
wget http://updates.jenkins-ci.org/latest/matrix-project.hpi
wget http://updates.jenkins-ci.org/latest/scm-api.hpi
wget http://updates.jenkins-ci.org/latest/ssh-credentials.hpi

service jenkins restart
