puppet-phppgadmin
=================

A Puppet module for configuring phpPgAdmin.

Build Status
------------

[![Build Status](https://travis-ci.org/knowshan/puppet-phppgadmin.png)](https://travis-ci.org/knowshan/puppet-phppgadmin)

Examples
--------

### Default install without Apache server installation
    include phppgadmin

### Install Apache server (default puppetlabs/puppetlabs-apache httpd install) and phpPgAdmin
    class {'phppgadmin':
      db_port        => '3333',
      install_apache => true,
    }


Recommended usage
-----------------

* Install and configure Apache web server using puppetlabs/puppetlabs-apache module using separate declaration/include ststement
* Install and configure phpPgAdmin using this module
 

Support
-------

Please log tickets and issues at our [Projects site](https://github.com/knowshan/puppet-phppgadmin)

License
-------

Apache License, Version 2.0

