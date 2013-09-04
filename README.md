puppet-phppgadmin
=================

A Puppet module for configuring phpPgAdmin.

Build Status
------------

* knowshan/puppet-phppgadmin [![Build Status](https://travis-ci.org/knowshan/puppet-phppgadmin.png)](https://travis-ci.org/knowshan/puppet-phppgadmin)


Dependencies
------------

Following dependencies are NOT required with default parameter settings. They
will be required if Apache web server or PostgreSQL database will be installed
by this module as well. Since these dependencies are not required by default,
they are not configured through Modulefile.

 * puppetlabs/puppetlabs-apache
 * puppetlabs/puppetlabs-postgresql


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


Contributors
------------

 * [knowshan](https://github.com/knowshan)
 * [flipkick](https://github.com/flipkick)
 * [deric](https://github.com/deric)


License
-------

Apache License, Version 2.0

