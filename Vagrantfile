# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

$ansiblesvr_script = <<-ANSIBLESVR_SCRIPT

sudo apt-get update -y
sudo apt-get install -y software-properties-common

sudo apt-add-repository ppa:ansible/ansible

sudo apt-get update -y 
sudo apt-get install ansible -y

sudo groupadd ansible
sudo useradd -d /home/ansible -m ansible -p ansible -g ansible -G sudo

sudo echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

sudo -u ansible ssh-keygen -b 2048 -t rsa -q -N '' -C "SSH Keys for Ansible User" -f /home/ansible/.ssh/id_rsa

sudo apt-get install -y python-pip python-dev build-essential

sudo pip install --upgrade pip

sudo pip install docker-py 

ANSIBLESVR_SCRIPT

Vagrant.configure("2") do |config|

  # create Ansible Server node
	config.vm.define "ansiblesvr" do |ansiblesvr_config|
		ansiblesvr_config.vm.box = "bento/ubuntu-16.04"
		ansiblesvr_config.vm.hostname = "ansiblesvr"
 		ansiblesvr_config.vm.network "private_network", type: "dhcp"
		ansiblesvr_config.vm.network "forwarded_port", guest: 80, host: 80
		ansiblesvr_config.vm.network "forwarded_port", guest: 443, host: 443

		ansiblesvr_config.vm.provider "virtualbox" do |vb|
 			vb.memory = "1024"
		end

    ansiblesvr_config.vm.provision "shell", inline: apt-get update
    ansiblesvr_config.vm.provision "shell", inline: apt-get install -y git
    ansiblesvr_config.vm.provision "shell", inline: git clone https://github.com/Boslx/DevOps_Lab09.git devops
    ansiblesvr_config.vm.provision "shell", inline: cd devops
		ansiblesvr_config.vm.boot_timeout = 600
		ansiblesvr_config.vm.provision "shell", inline: $ansiblesvr_script
		ansiblesvr_config.vm.provision "shell", inline: "sudo ansible-playbook '/ansible/init/playbook.yml' -v --extra-vars 'host_list=localhost'"
	end
end