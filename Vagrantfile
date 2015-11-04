# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.name = "overmind"
    v.memory = 4096
    v.cpus = 2
  end

  config.vm.box_check_update = true

  config.vm.provision "docker" do |docker|

    docker.run "wekan-db",
        image: "mongo:latest",
         args: "-d --restart=always"

    docker.run "wekan",
        image: "mquandalle/wekan:latest",
         args: "-d --restart=always -p 2000:80 --link \"wekan-db:db\" -e \"MONGO_URL=mongodb://db\" -e \"ROOT_URL=http://example.com\" "

    docker.run "gogs",
        image: "codeskyblue/docker-gogs:latest",
         args: "-d --restart=always -p 3000:3000 -p 3022:22 -v /var/gogs:/data"

    docker.run "registry",
        image: "registry:latest",
         args: "-d --restart=always -p 5000:5000 -e CORS_ORIGINS=[\'*\'] -e STORAGE_PATH=/registry -v /var/docker_registry:/registry"

    docker.run "jenkins",
        image: "jenkins:latest",
         args: "--restart=always -p 8080:8080 -v /var/jenkins:/var/jenkins"

    docker.run "rancher",
        image: "rancher/server:latest",
         args: "-d --restart=always -p 9000:8080"

    docker.run "cadvisor",
        image: "google/cadvisor-canary:latest",
         args: "-d --restart=always -p 9090:8080 --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --detach=true"

  end

  #WeKan web
  config.vm.network "forwarded_port", guest: 2000, host: 2000

  #Gogs web
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  #Docker image registry
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  #Jenkins
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  #Rancher
  config.vm.network "forwarded_port", guest: 9000, host: 8080

  #cAdvisor
  config.vm.network "forwarded_port", guest: 9090, host: 8080

  config.ssh.forward_agent = true


  # config.vm.synced_folder "share", "/home/vagrant/share"

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

end
