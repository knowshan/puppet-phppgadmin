puppet-phppgadmin
=================

A Puppet module for configuring phpPgAdmin.

Build Status
------------

knowshan/puppet-phppgadmin: [![Build Status](https://travis-ci.org/knowshan/puppet-phppgadmin.png)](https://travis-ci.org/knowshan/puppet-phppgadmin)
flipkick/puppet-phppgadmin: [![Build Status](https://travis-ci.org/flipkick/puppet-phppgadmin.png)](https://travis-ci.org/flipkick/puppet-phppgadmin)


Examples
--------

### Default install (no Apache or PostgreSQL server install)
    include phppgadmin

### Custom install (with Apache install and custom PostgreSQL server port)
    class {'phppgadmin':
      db_port        => '5433',
      install_apache => true,
    }


Recommended usage
-----------------

Use phpPgAdmin module to install and manage phpPgAdmin only.
Although this module supports default Apache and PostgreSQL installation using
puppetlabs modules, you should manage them externally for more customization
and better design. A module shouldn't manage all the resources/services on the
node, but only the resource/service it is designed to manage. 


Support
-------

Please log tickets and issues at our [Projects site](https://github.com/knowshan/puppet-phppgadmin)

License
-------

Apache License, Version 2.0

