default[:sysctl][:params][:vm][:overcommit_memory] 		= 1
default[:sysctl][:params][:fs][:file_max] 				= 120000

default[:ulimit][:user]									= "redis"
default[:ulimit][:filehandle_soft_limit]				= 102400
default[:ulimit][:filehandle_hard_limit]				= 102400

default[:redis][:daemonize] 							= "no"
default[:redis][:port] 									= 6379
default[:redis][:timeout] 								= 0