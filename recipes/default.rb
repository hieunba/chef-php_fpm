#
# Cookbook:: php_fpm
# Recipe:: default
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
include_recipe 'php_fpm::ppa'
include_recipe 'php_fpm::prepare'

php_packages = node['php_fpm']['packages'] || %w(php php-fpm)

php_packages.mapeach do |php_pkg|
  package php_pkg
end

package 'php-apcu'

include_recipe 'php_fpm::configure'
