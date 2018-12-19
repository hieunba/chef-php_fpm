#
# Cookbook:: php_fpm
# Recipe:: service
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
service_name = 'php-fpm'

php_fpm_service_name = "php#{node['php_fpm']['version']}-fpm"

service service_name do
  service_name php_fpm_service_name
  action :nothing
end
