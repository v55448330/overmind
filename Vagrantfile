# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.name = "overmind"
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.box_check_update = true

  config.vm.provision "docker" do |docker|
    docker.run "taskboard",
        image: "mirweb/taskboard:latest",
        args: "--restart=always -p 2000:80"

    docker.run "gogs",
        image: "codeskyblue/docker-gogs:latest",
        args: "--restart=always -p 3000:3000 3022:22 -v /var/gogs:/data"

    docker.run "registry",
        image: "registry:latest",
        args: "--restart=always -p 5000:5000"

    docker.run "registry-ui",
        image: "atcol/docker-registry-ui",
        args: "--restart=always -p 5050:8080"

    docker.run "jenkins",
        image: "jenkins:latest",
        args: "--restart=always -p 8080:8080 -p 50000:50000 -v /var/jenkins:/var/jenkins"

    docker.run "dockerboard",
        image: "dockerboard/dockerboard:latest",
        args: "--restart=always -p 8001:8001 -v /var/run/docker.sock:/var/run/docker.sock"

  end

  #For TaskBoard web
  config.vm.network "forwarded_port", guest: 2000, host: 2000

  #For TaskBoard web
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  #For docker registry
  config.vm.network "forwarded_port", guest: 5050, host: 5050

  #For docker registry-ui
  config.vm.network "forwarded_port", guest: 5050, host: 5050

  #For dockerboard
  config.vm.network "forwarded_port", guest: 8001, host: 8001

  #For jenkins
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  #For jenkins
  config.vm.network "forwarded_port", guest: 50000, host: 50000

  config.ssh.forward_agent = true

  # config.vm.synced_folder "share", "/home/vagrant/share"

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

end
