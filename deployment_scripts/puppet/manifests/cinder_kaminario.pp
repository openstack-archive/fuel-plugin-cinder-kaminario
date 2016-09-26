notice('MODULAR: cinder_kaminario')


class { 'kaminario::driver': }->
class { 'kaminario::krest': }->
class { 'kaminario::config': }~> Exec[cinder_volume]

exec {'cinder_volume':
  command => '/usr/sbin/service cinder-volume restart',}
