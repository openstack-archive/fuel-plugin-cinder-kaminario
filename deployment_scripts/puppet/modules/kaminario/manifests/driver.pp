class kaminario::driver{

$source_directory = '/tmp/openstack-cinder-driver/source/kaminario'
$target_directory = '/usr/lib/python2.7/dist-packages/cinder/volume/drivers/kaminario'
vcsrepo { '/tmp/openstack-cinder-driver':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/Kaminario/openstack-cinder-driver.git',
  user     => 'root',
  revision => 'Mitaka',
  }
file {$target_directory:
  ensure => 'directory',
  recurse => true,
  source => "file:///${source_directory}",
  }

file {'/usr/lib/python2.7/dist-packages/cinder/tests/unit/volume/drivers/':
  ensure => 'file',
  recurse => true,
  source => 'file:///tmp/openstack-cinder-driver/test',
  }

file { '/tmp/exception.sh':
  source => 'puppet:///modules/kaminario/exception.sh',
  recurse => true,
  mode  => '0744',
  notify => Exec['modify_exception'],
  }
exec { 'modify_exception':
  command => '/tmp/exception.sh',
  refreshonly => true,
  }

}
