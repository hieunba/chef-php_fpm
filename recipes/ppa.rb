#
# Cookbook:: php_fpm
# Recipe:: ppa
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
include_recipe 'apt::default'

Chef::Log.debug("Avoid using external PPA as much as possible")
