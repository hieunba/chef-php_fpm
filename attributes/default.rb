default['php_fpm']['repo']['uri'] = 'ppa:ondrej/php'
default['php_fpm']['version'] = '7.2'
default['php_fpm']['user'] = 'www-data'
default['php_fpm']['group'] = 'www-data'
default['php_fpm']['max_execution_time'] = 60
default['php_fpm']['memory_limit'] = '512M'
default['php_fpm']['log_file'] = '/var/log/php/error.log'
default['php_fpm']['slow_log_file'] = '/var/log/php/slow.log'
default['php_fpm']['fpm_log_file'] = '/var/log/php/fpm.log'
default['php_fpm']['display_errors'] = false
default['php_fpm']['log_errors'] = true
default['php_fpm']['socket_dir'] = '/var/run/php'
default['php_fpm']['tmp_dir'] = '/tmp/php'
default['php_fpm']['cli'] = ''

php_fpm_packages = %w(php-cli php-fpm php-curl php-gd php-mysql php-sqlite3
                      php-xml php-mbstring php-bcmath)
php_fpm_packages << 'php-zip'
default['php_fpm']['packages'] = php_fpm_packages
