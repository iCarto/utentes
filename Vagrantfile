# -*- mode: ruby -*-
# vi: set ft=ruby :

# Function to check whether VM was already provisioned
# https://stackoverflow.com/a/38203497/930271
def provisioned?(vm_name='default', provider='virtualbox')
    File.exist?(".vagrant/machines/#{vm_name}/#{provider}/action_provision")
end

Vagrant.configure(2) do |config|
    config.vm.box = "debian/contrib-stretch64"
    config.vm.box_url = "https://app.vagrantup.com/debian/boxes/contrib-stretch64"
    config.vm.box_check_update = false

    if Vagrant.has_plugin?("vagrant-cachier")
        config.cache.scope = :box
        config.cache.auto_detect = false
    end

    if Vagrant.has_plugin?("vagrant-vbguest")
        # Disable it if problems with shared folders or guest additions appears
        # or if you want to speed up `vagrant up` a bit
        config.vbguest.auto_update = false
    end

    config.vm.network "forwarded_port", guest: 6543, host: 9000
    config.vm.network "forwarded_port", guest: 5433, host: 9001

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "1512"
    end

    config.vm.provision "shell", path:"server/bootstrap.sh"
end
