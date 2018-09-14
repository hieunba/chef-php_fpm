#
# Cookbook:: php_fpm
# Recipe:: apcu
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.

package 'php-apcu' unless node['php_fpm']['version'].to_int == 5
