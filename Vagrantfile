# -*- mode: ruby -*-
# vi: set ft=ruby :

# load configs
require 'yaml'
current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/vagrant.config.yml")
vagrant_config = configs['configs']

#require necessary plugins
required_plugins = %w( vagrant-hostmanager vagrant-vbguest )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = vagrant_config['memory']
    vb.cpus = vagrant_config['cpus']
  end

  config.vm.synced_folder ".", "/vagrant"

  # auto update guest additions
  config.vbguest.auto_update = true

  config.vm.network "private_network", ip: vagrant_config['ip']
  config.vm.hostname = vagrant_config['domain']

  config.vm.provision "shell", path: "python.script.bash"
  config.vm.provision "shell", path: "ssh.script.bash", privileged: false
end
