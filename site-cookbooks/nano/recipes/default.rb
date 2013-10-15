include_recipe "redis"
include_recipe "sysctl"
include_recipe "ulimit"

sysctl_param 'vm.overcommit_memory' do
  value node[:sysctl][:params][:vm][:overcommit_memory]
  action :apply
end

sysctl_param 'fs.file-max' do
  value node[:ulimit][:filehandle_limit]
end

user_ulimit node[:ulimit][:user] do
  filehandle_limit node[:ulimit][:filehandle_limit]
  filehandle_soft_limit node[:ulimit][:soft_filehandle_limit]
  filehandle_hard_limit node[:ulimit][:hard_filehandle_limit]
end

include_recipe "nano::upstart"