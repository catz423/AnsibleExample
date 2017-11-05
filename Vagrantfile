# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.define "control" do |ctl|
    ctl.vm.box = "centos/7"
    #ctl.vm.box_version = "20171030.0.1"
    ctl.vm.hostname = "centos-control"
    ctl.vm.network "private_network", ip: "10.10.10.2"
    ctl.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end
  end

  config.vm.define "webserver01" do |web01|
    web01.vm.box = "jptoto/Windows2012R2"
    web01.vm.hostname = "win-webserver01"
    web01.vm.communicator = "winrm"
    web01.winrm.username = "vagrant"
    web01.winrm.password = "vagrant"
    web01.vm.network "private_network", ip: "10.10.10.3"
    web01.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
  end

  config.vm.define "webserver02" do |web02|
    web02.vm.box = "jptoto/Windows2012R2"
    web02.vm.hostname = "win-webserver02"
    web02.vm.communicator = "winrm"
    web02.winrm.username = "vagrant"
    web02.winrm.password = "vagrant"
    web02.vm.network "private_network", ip: "10.10.10.4"
    #web02.vm.provison "shell", path = "WinSetup.ps1"
    web02.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
    end
    web02.vm.provision "shell" do |s|
      s.path = "WinSetup.ps1"
    end
  end

end
