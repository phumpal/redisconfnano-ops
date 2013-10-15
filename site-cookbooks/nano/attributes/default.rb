default[:sysctl][:params][:vm][:overcommit_memory] = 1
default[:sysctl][:params][:fs][:file_max] = 102400

default[:ulimit][:filehandle_limit] = 102400
default[:ulimit][:soft_filehandle_limit] = 102400
default[:ulimit][:hard_filehandle_limit] = 102400

default[:redis][:daemonize] = "no"
default[:redis][:port] = 6379
default[:redis][:timeout] = 0
