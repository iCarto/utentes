# -*- mode: ruby -*-
# vi: set ft=ruby :

# Function to check whether VM was already provisioned
# https://stackoverflow.com/a/38203497/930271
def provisioned?(vm_name='default', provider='virtualbox')
    File.exist?(".vagrant/machines/#{vm_name}/#{provider}/action_provision")
end

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.box_version = "20220711.0.0"
    config.vm.box_check_update = false

    if Vagrant.has_plugin?("vagrant-vbguest")
        # Disable it if problems with shared folders or guest additions appears
        # or if you want to speed up `vagrant up` a bit
        config.vbguest.auto_update = false
    end

    config.vm.network "forwarded_port", guest: 80, host: 8000
    config.vm.network "forwarded_port", guest: 9001, host: 9001

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "2048"
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--cpuexecutioncap", "85"]
    end

    config.vm.provision "shell", path:"server/bootstrap.sh", args: ["DEV"]
end
