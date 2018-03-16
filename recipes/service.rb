#
# Cookbook:: php_fpm
# Recipe:: service
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
service_name = 'php-fpm'

service service_name do
  service_name node['php_fpm']['service'] || 'php7.0-fpm'
  action :nothing
end
