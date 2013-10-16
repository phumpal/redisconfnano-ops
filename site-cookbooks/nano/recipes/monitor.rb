include_recipe "monit::server"

cookbook_file "/etc/monit/conf.d/redis-server.conf" do
  source "redis_monit.conf"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[monit]"
end