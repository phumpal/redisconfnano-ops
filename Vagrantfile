# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.cache.auto_detect = true unless config.cache.nil?
  config.omnibus.chef_version = :latest unless config.omnibus.nil?
  config.berkshelf.enabled = true unless config.berkshelf.nil?

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  [1].each do |node_num|
    node = "#{File.basename(File.dirname(__FILE__))}-#{node_num}".to_sym
    config.vm.define node do |node_config|
      #node_config.vm.network :private_network, ip: "33.33.33.#{50 + node_num}"
      config.vm.network :public_network
      node_config.vm.hostname = node.to_s
      node_config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = ['site-cookbooks', 'cookbooks']
        chef.roles_path     = 'roles'
        chef.arguments      = '-l debug'
        chef.run_list = [
          "role[base]",
          "recipe[nano::default]",
          "recipe[nano::backups]",
          "recipe[nano::monitor]"
        ]
      end
    end
  end
end
