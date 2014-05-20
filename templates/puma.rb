#!/usr/bin/env puma
project = 'PROJECT'

environment 'production'
pidfile "/var/www/#{project}/shared/sockets/puma.pid"
state_path "/var/www/#{project}/shared/sockets/puma.state"
stdout_redirect "/var/www/#{project}/current/log/puma.log", "/var/www/#{project}/current/log/puma-error.log", true
threads 0, 4
bind "unix:///var/www/#{project}/shared/sockets/puma.sock"
activate_control_app "unix:///var/www/#{project}/shared/sockets/pumactl.sock"
