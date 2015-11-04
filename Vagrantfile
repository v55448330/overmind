# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.name = "overmind"
    v.memory = 8192
    v.cpus = 2
  end

  config.vm.box_check_update = true



  config.vm.provision "docker" do |docker|
    docker.run "cadvisor",
        image: "google/cadvisor-canary:latest",
        args: "-d --restart=always -p 2000:8080 --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro --detach=true"

    docker.run "wekan-db",
        image: "mongo:latest",
         args: "-d --restart=always"

    docker.run "wekan",
        image: "mquandalle/wekan:latest",
         args: "-d --restart=always -p 2200:80 --link \"wekan-db:db\" -e \"MONGO_URL=mongodb://db\" -e \"ROOT_URL=http://example.com\" "

    docker.run "gogs",
        image: "codeskyblue/docker-gogs:latest",
         args: "-d --restart=always -p 3000:3000 -p 3022:22 -v /var/gogs:/data"

    docker.run "registry",
        image: "registry:latest",
         args: "-d -p 5000:5000 -e STORAGE_PATH=/registry -v /var/docker_registry:/registry"

    docker.run "registry-ui",
        image: "atcol/docker-registry-ui:latest",
         args: "-d -p 5050:8080"

    docker.run "jenkins",
        image: "jenkins:latest",
         args: "-d -p 8080:8080 -p 50000:50000 -v /var/jenkins:/var/jenkins"

    # docker.run "rancher",
    #     image: "rancher/server:latest",
    #      args: "-d -p 8000:8080"


  end

  #For cAdvisor
  config.vm.network "forwarded_port", guest: 2000, host: 2000

  #For WeKan web
  config.vm.network "forwarded_port", guest: 2200, host: 2200

  #For Gogs web
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  #For Gogs ssh
  config.vm.network "forwarded_port", guest: 3022, host: 3022

  #For docker registry
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  #For docker registry-ui
  config.vm.network "forwarded_port", guest: 5050, host: 5050

  #For rancher
  config.vm.network "forwarded_port", guest: 8000, host: 8000

  #For jenkins
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  #For jenkins
  config.vm.network "forwarded_port", guest: 50000, host: 50000


  config.ssh.forward_agent = true


  # config.vm.synced_folder "share", "/home/vagrant/share"

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

end
