## Requirements

Install Ruby then

    bundle install

Install Vagrant then

    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-omnibus
    vagrant plugin install vagrant-berkshelf

You'll also need [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

but I would recommend dropping some loot on [VMware Fusion](http://www.vmware.com/products/fusion/) (or Workstation if you're on Windows) and the [VMware Vagrant provisioner](http://www.vagrantup.com/vmware)

## Launch on Virtualbox
	vagrant up 

## Launch on VMware Fusion
	vagrant up --provider=vmware_fusion

## Launch a redis-server on AWS with S3 backups
    vagrant up --provider=aws

## Laucn a redis-server on Rackspace with CloudFile backups
    vagrant up --provider=rackspace