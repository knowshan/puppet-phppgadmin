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

  $install_apache     = false   # if true, default apache install using puppetlabs-apache
  $install_postgres   = false   # if true, default postgresql install using puppet-postgresql
  $db_host            = ''      # default - unix socket connection
  $db_port            = '5432'  #
  
  
  case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora': {
      $phppgadmin_package = 'phpPgAdmin'
      $phppgadmin_conf_file = '/etc/phpPgAdmin/config.inc.php'
      $http_conf_file = '/etc/httpd/conf.d/phpPgAdmin.conf'
      $http_conf_template_file = 'phppgadmin/CentOS/phpPgAdmin.conf.erb'
    }
    'Debian', 'Ubuntu': {
      $phppgadmin_package = 'phppgadmin'
      $phppgadmin_conf_file = '/etc/phppgadmin/config.inc.php'
      $http_conf_file = '/etc/apache2/conf.d/phppgadmin'
      $http_conf_template_file = 'phppgadmin/Ubuntu/phppgadmin.conf.erb'
    }
    default: { fail("Unsupported platform: ${::osfamily}/${::operatingsystem}") }
  }
}
