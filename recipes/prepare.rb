#
# Cookbook:: php_fpm
# Recipe:: prepare
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
php_user = node['php_fpm']['user'] || 'www-data'
php_group = node['php_fpm']['group'] || 'www-data'

directory node['php_fpm']['tmp_dir'] do
  mode 0o755
  owner php_user
  group php_group
end

directory ::File.dirname(node['php_fpm']['log_file']) do
  mode 0o755
  owner php_user
  group php_group
end

file node['php_fpm']['log_file'] do
  mode 0o644
  owner php_user
  group php_group
end

file node['php_fpm']['slow_log_file'] do
  mode 0o644
  owner php_user
  group php_group
end

file node['php_fpm']['fpm_log_file'] do
  mode 0o644
  owner php_user
  group php_group
end

directory node['php_fpm']['socket_dir'] do
  mode 0o755
  owner php_user
  group php_group
end
