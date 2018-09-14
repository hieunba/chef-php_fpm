#
# Cookbook:: php_fpm
# Recipe:: default
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
include_recipe 'php_fpm::ppa'
include_recipe 'php_fpm::prepare'

php_packages = if node['php_fpm']['version']
  node.default['php_fpm']['packages'].map { |p| p.insert 3, node['php_fpm']['version'] }
else
  node['php_fpm']['packages']
end

php_packages.each do |php_pkg|
  package php_pkg
end

include_recipe 'php_fpm::apcu'
include_recipe 'php_fpm::configure'
