name 'php_fpm'
maintainer 'Nghiem Ba Hieu'
maintainer_email 'hi3unb@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures php_fpm'
long_description 'Installs/Configures php_fpm'
version '0.1.2'
chef_version '>= 12.18.31' if respond_to?(:chef_version)

supports 'ubuntu', '>= 16.04'
depends 'apt', '~> 6.1.4'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/hieunba/php_fpm/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/hieunba/php_fpm'
