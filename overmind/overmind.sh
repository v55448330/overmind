sudo docker run -d --restart=always --name=wekan-db mongo
sudo docker run -d --restart=always --name=wekan -p 2000:80  --link "wekan-db:db" -e "MONGO_URL=mongodb://db" -e ROOT_URL="http://example.com"  mquandalle/wekan
sudo docker run -d --restart=always --name=gogs -p 3000:3000 -p 3022:22  -v /var/services/gogs:/data gogs/gogs
sudo docker run -d --restart=always --name=registry -p 5000:5000 -v /var/data:/var/lib/registry registry:2
sudo docker run -d --restart=always --name=jenkins -p 8080:8080 -p 50000:50000 -u root -/var/services/jenkins_home/:/var/jenkins_home/:rw jenkins
sudo docker run -d --restart=always --name=rancher-server -p 9000:8080 rancher/server
sudo docker run -d --restart=always --name=cadvisor -p 9099:8080 --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --detach=true  google/cadvisor
