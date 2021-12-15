# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/35-cloud-base"
  config.vm.box_version = "35.20211026.0"
  #  configure as public network for other devices find this instance
  config.vm.network "public_network"
  config.vm.hostname = "roonux"
  config.vm.provider "virtualbox" do |vb|
    # safe settings for startup and tested loads
    vb.memory = "2048"
    vb.cpus = "2"
  end
  config.vm.provision "shell", path: "fedora-setup.sh"
end
