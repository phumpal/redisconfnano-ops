## Requirements

Install Ruby then

    bundle install

Install Vagrant then

    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-omnibus
    vagrant plugin install vagrant-berkshelf

You'll also need [Virtualbox](https://www.virtualbox.org/wiki/Downloads) but I would recommend dropping some loot on [VMware Fusion](http://www.vmware.com/products/fusion/) (or Workstation if you're on Windows) and the [Vagrant VMware provisioner](http://www.vagrantup.com/vmware)

## Launch on Virtualbox
	vagrant up 

## Launch on VMware Fusion
	vagrant up --provider=vmware_fusion

## Redis on AWS with S3 backups
	vagrant plugin install vagrant-aws
    vagrant up --provider=aws

## Redis on Rackspace with CloudFile backups
    vagrant plugin install vagrant-rackspace
    vagrant up --provider=rackspace