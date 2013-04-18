require 'spec_helper'

describe 'phppgadmin' do
  describe 'test with CentOS OS' do
    context 'with OS as CentOS' do
      let (:facts) {{:operatingsystem => 'CentOS'}}
      it do should contain_file('/etc/phpPgAdmin/config.inc.php').with({
        'ensure'  => 'present',
        'mode'    => '0644',
        'content' => /<?php/,
        'require' => 'Package[phpPgAdmin]',
      }) end
      # test http conf file
      it do should contain_file('/etc/httpd/conf.d/phpPgAdmin.conf').with({
        'ensure'  => 'present',
        'mode'    => '0644',
        'content' => /<Location \/phpPgAdmin>/,
        'require' => 'Package[phpPgAdmin]',
      }) end
    end
  end
end       
