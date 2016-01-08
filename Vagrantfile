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

  #WeKan web
  config.vm.network "forwarded_port", guest: 2000, host: 2000

  #Gogs web
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  #Docker image registry
  config.vm.network "forwarded_port", guest: 5000, host: 5000

  #Jenkins master
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  #Jenkins slave control
  config.vm.network "forwarded_port", guest: 50000, host: 50000

  #Rancher
  config.vm.network "forwarded_port", guest: 9000, host: 9000

  #cAdvisor
  config.vm.network "forwarded_port", guest: 9090, host: 9090

  #SSH
  config.ssh.forward_agent = true

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  #Provision
  config.vm.provision "shell", path: "provision.sh"

end
