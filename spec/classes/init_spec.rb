require 'spec_helper'

describe 'phppgadmin' do
  describe 'test with CentOS OS' do
    context 'with OS as CentOS' do
      let (:facts) {{:operatingsystem => 'CentOS'}}
      it do should contain_file_line('phppgadmin_conf_file_host').with({
        'path'    => '/etc/phpPgAdmin/config.inc.php',
        'match'   => "\\t\\\$conf\\['servers'\\]\\[0\\]\\['host'\\] = '.*';$",
        'line'    => "\t\$conf['servers'][0]['host'] = '';",
        'require' => 'Package[phpPgAdmin]',
      }) end
      it do should contain_file_line('phppgadmin_conf_file_port').with({
        'path'    => '/etc/phpPgAdmin/config.inc.php',
        'match'   => "\\t\\\$conf\\['servers'\\]\\[0\\]\\['port'\\] = \\d+;$",
        'line'    => "\t\$conf['servers'][0]['port'] = 5432;",
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
