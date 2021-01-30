# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/bionic64"
  
  config.vm.box_download_insecure = "true"
  
  config.vm.box_check_update = false
  config.vm.network "private_network", type: "dhcp"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "6144"
    vb.cpus = 4
    vb.name = "ubuntu-dev-environment"
  end
 
  config.vm.define "ubuntu-dev-environment" do |server|
     server.vm.network :private_network, ip: "10.0.0.10"
     server.vm.hostname = "ubuntu-dev-environment"
  end
  
  config.vm.network "forwarded_port", guest: 7070, host: 7070
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9090, host: 9090
  config.vm.network "forwarded_port", guest: 9898, host: 9898

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    #docker
    sudo apt-get update
    sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker vagrant
    sudo systemctl enable docker

    sudo yum install -y wget unzip

    #CONFIGURE TERMINAL COLOR
    sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
    grep force_color_prompt ~/.bashrc
    sudo sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
    sudo grep force_color_prompt ~/.bashrc
    echo "source <(kubectl completion bash)" >> ~/.bashrc
    
    #CONFIGURE GIT
    git config --global user.email "mmartinezespichan@gmail.com"
    git config --global user.name "Miguel Martinez"
  SHELL
end
