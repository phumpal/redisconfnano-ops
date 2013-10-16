include_recipe "redis::server"
include_recipe "sysctl"
include_recipe "ulimit"

sysctl_param 'vm.overcommit_memory' do
  value node[:sysctl][:params][:vm][:overcommit_memory]
  action :apply
end

user_ulimit node[:redis][:user] do
  filehandle_soft_limit node[:ulimit][:filehandle_soft_limit]
  filehandle_hard_limit node[:ulimit][:filehandle_hard_limit]
end

include_recipe "nano::upstart"