# == Class: phppgadmin::params
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
# === Authors
#
# Shantanu Pavgi <knowshantanu@gmail.com>
#
# === Copyright
#
# Copyright 2013 Shantanu Pavgi.
#
class phppgadmin::params {

  # Supported OS
  $supported_os = ['^CentOS$']
  validate_re($operatingsystem,$supported_os)

  $install_apache     = false
  $db_host            = ''
  $db_port            = '5432'

  $phppgadmin_package = $operatingsystem ? {
    CentOS  => 'phpPgAdmin',
    default => undef,
  }

  $phppgadmin_conf_file = $operatingsystem ? {
    CentOS  => '/etc/phpPgAdmin/config.inc.php',
    default => undef,
  }

  $http_conf_file = $operatingsystem ? {
    CentOS  => '/etc/httpd/conf.d/phpPgAdmin.conf',
    default => undef,
  }
}
