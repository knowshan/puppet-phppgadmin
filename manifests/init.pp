# == Class: phppgadmin
#
# Install and configure phpPgAdmin.
# Recommended usage:
#  * This module supports basic apache install-config using puppetlabs-apache
# module, however, for a complex apache configuration should be handled
# separately. It's not  a limitation of the module, but a good design practice
# to avoid collision between modules.
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
  validate_re($::operatingsystem,$supported_os)

  $http_conf_file       = $phppgadmin::params::http_conf_file
  $phppgadmin_package   = $phppgadmin::params::phppgadmin_package
  $phppgadmin_conf_file = $phppgadmin::params::phppgadmin_conf_file

  if $install_apache == true {
    class {'apache': }
    class {'apache::mod::php': }
    package{$phppgadmin_package:
      ensure  => installed,
      require => Class['apache::mod::php'],
    }
  }
  else {
    package{$phppgadmin_package:
      ensure => installed,
    }
  }

  file{$http_conf_file:
    ensure  => present,
    mode    => '0644',
    content => template('phppgadmin/phpPgAdmin.conf.erb'),
    require => Package[$phppgadmin_package],
  }

  file_line{'phppgadmin_conf_file_host':
    path    => $phppgadmin_conf_file,
    match   => "\\t\\\$conf\\['servers'\\]\\[0\\]\\['host'\\] = '.*';$",
    line    => "\t\$conf['servers'][0]['host'] = '${db_host}';",
    require => Package[$phppgadmin_package],
  }


  file_line{'phppgadmin_conf_file_port':
    path    => $phppgadmin_conf_file,
    match   => "\\t\\\$conf\\['servers'\\]\\[0\\]\\['port'\\] = \\d+;$",
    line    => "\t\$conf['servers'][0]['port'] = ${db_port};",
    require => Package[$phppgadmin_package],
  }
}
