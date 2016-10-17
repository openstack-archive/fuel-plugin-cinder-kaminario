notice('MODULAR: cinder_kaminario')


class { 'kaminario::krest': }->
class { 'kaminario::driver': }->
class { 'kaminario::config': } ~> Service['cinder_volume']

service { 'cinder_volume':
  ensure     => running,
  name       => cinder-volume,
  enable     => true,
  hasstatus  => true,
  hasrestart => true,

}
