# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/stretch64"
  config.vm.box_url = "https://app.vagrantup.com/debian/boxes/stretch64"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 6543, host: 9000
  config.vm.network "forwarded_port", guest: 5432, host: 9001

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"


  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1512"
  end

  config.vm.provision "shell", path:"server/bootstrap.sh"
end
