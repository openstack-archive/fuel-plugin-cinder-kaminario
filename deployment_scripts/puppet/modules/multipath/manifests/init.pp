class multipath {
$multipath_packages = [ 'sg3-utils', 'multipath-tools' ]
package { $multipath_packages: ensure => 'installed' }

nova_config {
'libvirt/iscsi_use_multipath' :   value => True,
}~> Exec[cinder_volume]

exec {'cinder_volume':
  command => '/usr/sbin/service nova-compute restart',}

}
