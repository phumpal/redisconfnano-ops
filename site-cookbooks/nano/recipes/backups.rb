include_recipe "rvm::system"
include_recipe "cron"

user node[:redis][:user] do
  shell "/bin/bash"
end

directory "/var/tmp/Backup" do
  owner node[:redis][:user]
  group node[:redis][:user]
  action :create
end

case node.chef_environment
when "rackspace"
  template "/var/tmp/Backup/config.rb" do
    source "backups_rack.erb"
    mode 0644
    owner node[:redis][:user]
    group node[:redis][:user]
    variables ({
      :rackspace_api_key => default[:rackspace][:api][:key],
      :rackspace_user => default[:rackspace][:user],
      :slave_ip => node[:rackspace][:private_ip],
      :rackspace_cf_container => node[:rackspace][:cf][:container],
      :rackspace_cf_segments => node[:rackspace][:cf][:segments]
    })
  end
when "aws"
  template "/var/tmp/Backup/config.rb" do
    source "backups_aws.erb"
    mode 0644
    owner node[:redis][:user]
    group node[:redis][:user]
    variables ({
      :access_key_id => node[:aws][:access_key_id],
      :secret_access_key => node[:aws][:secret_access_key],
      :slave_ip => node[:ipaddress],
      :region => node[:aws][:region],
      :bucket => node[:aws][:bucket],
      :path => '/'
    })
  end
else
  template "/var/tmp/Backup/config.rb" do
    source "backups_local.erb"
    mode 0644
    owner node[:redis][:user]
    group node[:redis][:user]
    variables ({
      :slave_ip => node[:ipaddress],
      :slave_port => 6379,
      :backups_path => node[:local][:path],
      :rotate_me => node[:local][:rotate_me]
    })
  end
end

cron_d "redis_backups" do
  minute 30
  command "/bin/bash -l -c 'backup perform -t redis_backups --config-file /var/tmp/Backup/config.rb'"
  user "redis"
end