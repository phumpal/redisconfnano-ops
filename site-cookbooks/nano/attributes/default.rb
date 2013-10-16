default[:sysctl][:params][:vm][:overcommit_memory] 		= 1
default[:sysctl][:params][:fs][:file_max] 				= 120000

default[:ulimit][:filehandle_soft_limit]				= 102400
default[:ulimit][:filehandle_hard_limit]				= 102400

default[:redis][:user]									= "redis"
default[:redis][:group]									= "redis"
default[:redis][:daemonize] 							= "no"
default[:redis][:port] 									= 6379
default[:redis][:timeout] 								= 0

default[:rackspace][:api][:key]							= nil
default[:rackspace][:user]								= nil
default[:rackspace][:cf][:container]					= nil
default[:rackspace][:cf][:segments]						= nil

default[:aws][:access_key_id]							= nil
default[:aws][:secret_access_key]						= nil
default[:aws][:region]									= nil
default[:aws][:bucket]									= nil
default[:aws][:path]									= nil

default[:local][:path]									= nil
default[:local][:rotate]								= nil


default[:rvm][:version]									= "latest"
default[:rvm][:default_ruby] 							= "ruby-2.0.0-p247"
default[:rvm][:rubies]									= [ "ruby-2.0.0-p247" ]
default[:rvm][:global_gems]								= [ { "name": "backup" } ]