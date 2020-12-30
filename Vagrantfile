Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|

  config.vm.hostname = "devops_host"
  config.vm.box = "generic/centos7"

  config.vm.network :private_network, ip: "192.168.3.141"
  config.vm.network "forwarded_port", guest: 8080, host: 7000

  config.ssh.insert_key = false

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.raw_arguments  = "--ask-vault-pass"
    ansible.playbook = "ansible/init/playbook.yml"
  end
end