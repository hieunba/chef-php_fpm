#
# Cookbook:: php_fpm
# Recipe:: ppa
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
include_recipe 'apt::default'

apt_repository 'ondrej-php' do
  uri node['php_fpm']['repo']['uri']
end
