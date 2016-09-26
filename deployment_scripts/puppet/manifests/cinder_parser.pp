ini_setting { 'parser':
    ensure  => present,
    path    => '/etc/puppet/puppet.conf',
    section => 'main',
    setting => 'parser',
    value   => 'future',
  }

