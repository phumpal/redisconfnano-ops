service "redis-server" do
  provider Chef::Provider::Service::Init::Debian
  action [ :stop, :disable ]
end

cookbook_file "/etc/init/redis-server.conf" do
  source "redis_server.conf"
  mode 0644
  owner "root"
  group "root"
end

directory "/var/run/redis" do
  owner "redis"
  group "redis"
  action :create
end

service "redis-server" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
