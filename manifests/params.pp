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
  $supported_os = ['^CentOS$', '^Ubuntu$']
  validate_re($operatingsystem,$supported_os)

  $install_apache     = false   # if true, default apache install using puppetlabs-apache
  $install_postgres   = false   # if true, default apache install using puppet-postgresql
  $db_host            = ''      # default - unix socket connection
  $db_port            = '5432'  #

  $phppgadmin_package = $operatingsystem ? {
    CentOS  => 'phpPgAdmin',
    Ubuntu  => 'phppgadmin',
    default => undef,
  }

  $phppgadmin_conf_file = $operatingsystem ? {
    CentOS  => '/etc/phpPgAdmin/config.inc.php',
    Ubuntu  => '/etc/phppgadmin/config.inc.php',
    default => undef,
  }

  $http_conf_file = $operatingsystem ? {
    CentOS  => '/etc/httpd/conf.d/phpPgAdmin.conf',
    Ubuntu  => '/etc/apache2/conf.d/phppgadmin',
    default => undef,
  }

  $http_conf_template_file = $operatingsystem ? {
    CentOS  => 'phppgadmin/CentOS/phpPgAdmin.conf.erb',
    Ubuntu  => 'phppgadmin/Ubuntu/phppgadmin.conf.erb',
    default => undef,
  }
}
