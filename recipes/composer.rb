#
# Author:: Nghiem Ba Hieu
# Cookbook:: php_fpm
# Recipe:: composer
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved
include_recipe 'php_fpm::default'

composer_hash = 'c6d3f7f9e650e6eb5bba8a4f2a569b23c5b5fe10ec75fbc79c5cec21064c7e4f'
composer_commit = '04c1494fdd0c8fdefa2f164b8c0d066c8aa3a46f'
composer_installer_url = "https://raw.githubusercontent.com/composer/getcomposer.org/#{composer_commit}/web/installer"
composer_installer_path = ::File.join(Chef::Config[:file_cache_path], 'installer')

remote_file composer_installer_path do
  source composer_installer_url
  checksum composer_hash
  action :create_if_missing
end

bash 'install composer' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    php #{composer_installer_path} --install-dir=/usr/local/bin --filename=composer
  EOH
  action :run
  not_if { ::File.exist?('/usr/local/bin/composer') }
end
