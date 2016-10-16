class multipath {

include ::nova::params

$multipath_packages = [ 'sg3-utils', 'multipath-tools' ]
package { $multipath_packages: ensure => 'installed' }

nova_config {
  'libvirt/iscsi_use_multipath' :   value => True,
}

service { 'nova_compute':
  ensure     => running,
  name       => $::nova::params::compute_service_name,
  enable     => true,
  hasstatus  => true,
  hasrestart => true,
}

Nova_config<||> ~> Service['nova-compute']
}
