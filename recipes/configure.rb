#
# Cookbook:: php_fpm
# Recipe:: configure
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
include_recipe 'php_fpm::service'

php_version = node['php_fpm']['version']

php_etc_dir = "/etc/php/#{php_version}"
php_fpm_dir = "#{php_etc_dir}/fpm"
php_cli_dir = "#{php_etc_dir}/cli"
php_conf_dir = "#{php_cli_dir}/conf.d"
php_fpm_conf_file = "#{php_fpm_dir}/php-fpm.conf"
php_fpm_ini_file = "#{php_fpm_dir}/php.ini"
php_cli_ini_file = "#{php_cli_dir}/php_cli.ini"

template php_cli_ini_file do
  mode 0o644
  source 'php.ini.erb'
  variables(
    :display_errors	=> 'On',
    :memory_limit	=> node['php_fpm']['cli']['memory_limit'] || '1024M',
    :enable_dl		=> 'On'
  )
  owner 'root'
  group 'root'
end

link "#{php_conf_dir}/10-phpcli.ini" do
  to php_cli_ini_file
end

template php_fpm_ini_file do
  mode 0o644
  source 'php.ini.erb'
  variables(
    :enable_dl		=> 'Off',
    :memory_limit	=> node['php_fpm']['memory_limit'] || '512M',
    :display_errors	=> node['php_fpm']['display_errors']
  )
  owner 'root'
  group 'root'
  notifies :restart, 'service[php-fpm]', :delayed
end

template php_fpm_conf_file do
  mode 0o644
  source 'php-fpm.conf.erb'
  owner 'root'
  group 'root'
  variables(
    php_fpm_socket_dir: node['php_fpm']['socket_dir'],
    php_fpm_socket_file: "php#{node['php_fpm']['version']}-fpm.sock",
    php_fpm_pid_file: "php#{node['php_fpm']['version']}-fpm.pid"
  )
  notifies :restart, 'service[php-fpm]', :delayed
end

template '/etc/logrotate.d/php' do
  source 'logrotate.erb'
  mode 0o644
  owner 'root'
  group 'root'
end
