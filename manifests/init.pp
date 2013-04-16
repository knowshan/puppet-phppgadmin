# == Class: phppgadmin
#
# Install and configure phpPgAdmin.
# Recommended usage:
#  * This module supports basic apache install-config using puppetlabs-apache module,
#  however, for a complex apache configuration should be handled separately. It's not
#  a limitation of the module, but a good design practice to avoid collision between modules. 
#
# [*sample_parameter*]
#
# === Variables
#
# Module variables 
#
# [*db_host*]
#  PostgreSQL database host - configured in /etc/phpPgAdmin/config.inc.php  
#
# [*db_port*]
#  PostgreSQL database port - configured in /etc/phpPgAdmin/config.inc.php  
# 
# === Examples
#
#  class { phppgadmin:
#    db_host => 'localhost'
#  }
#
# === Authors
#
# Shantanu Pavgi <knowshantanu@gmail.com>
#
# === Copyright
#
# Copyright 2013 Shantanu Pavgi.
#
class phppgadmin (
  $install_apache       = $phppgadmin::params::install_apache,
  $db_host              = $phppgadmin::params::db_host,
  $db_port              = $phppgadmin::params::db_port
) inherits phppgadmin::params {
  # Supported OS
  $supported_os = ['^CentOS$']
  validate_re($operatingsystem,$supported_os)

  $http_conf_file       = $phppgadmin::params::http_conf_file
  $phppgadmin_package   = $phppgadmin::params::phppgadmin_package
  $phppgadmin_conf_file = $phppgadmin::params::phppgadmin_conf_file
  
  package{$phppgadmin_package:
    ensure => installed,
  }

  file{$http_conf_file:
    mode    => 644,
    ensure  => present, 
    content => template('phppgadmin/phpPgAdmin.conf.erb'),
    require => Package[$phppgadmin_package],
  }

  file{$phppgadmin_conf_file:
    mode    => 644,
    ensure  => present,
    content => template('phppgadmin/config.inc.php.erb'),
    require => Package[$phppgadmin_package],
  }


}
