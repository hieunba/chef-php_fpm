#
# Cookbook:: php_fpm
# Recipe:: default
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
include_recipe 'php_fpm::ppa'
include_recipe 'php_fpm::prepare'

php_version = node['php_fpm']['version'].to_s

php_packages = if php_version
  node.default['php_fpm']['packages'].map { |p| p.insert 3, php_version }
else
  node['php_fpm']['packages']
end

if Gem::Version.new(php_version) < Gem::Version.new('7.2')
  php_packages << "php#{php_version}-mcrypt"
end

php_packages.each do |php_pkg|
  package php_pkg
end

include_recipe 'php_fpm::apcu'
include_recipe 'php_fpm::configure'
