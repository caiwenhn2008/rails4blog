#!/usr/bin/env puma

environment 'development'
threads 2, 32 # minimum 2 threads, maximum 64 threads
workers 2

app_name = 'rails4blog'

application_path = "#{ENV["rails_app_home"]}/#{app_name}"

directory "#{application_path}"

pidfile "#{application_path}/shared/tmp/pids/puma.pid"
state_path "#{application_path}/shared/tmp/sockets/puma.state"
stdout_redirect "#{application_path}/shared/log/puma.stdout.log", "#{application_path}/shared/log/puma.stderr.log"


# bind "unix://#{application_path}/shared/tmp/sockets/puma.sock"  #绑定sock
bind 'tcp://127.0.0.1:3000'    #绑定端口801
worker_timeout 60

#daemonize true

preload_app!