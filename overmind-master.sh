sudo docker run -d --restart=always --name=wekan-db mongo
sudo docker run -d --restart=always --name=wekan -p 2000:80  --link "wekan-db:db" -e "MONGO_URL=mongodb://db" -e ROOT_URL="http://example.com"  mquandalle/wekan
sudo docker run -d --restart=always --name=cadvisor -p 9090:8080 --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --detach=true  google/cadvisor
sudo docker run -d --restart=always --name=jenkins -p 8080:8080 -p 50000:50000 jenkins
sudo docker run -d --restart=always --name=registry -p 5000:8080 registry:2
sudo docker run -d --restart=always --name=rancher-server -p 9000:8080 rancher/server
