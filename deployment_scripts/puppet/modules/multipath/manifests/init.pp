class multipath {
$plugin_settings = hiera('cinder_kaminario')
$multi_0 = $plugin_settings["enable_multipath_0"] 
$multi_1 = $plugin_settings["enable_multipath_1"]
$multi_2 = $plugin_settings["enable_multipath_2"]
$multi_3 = $plugin_settings["enable_multipath_3"]
$multi_4 = $plugin_settings["enable_multipath_4"]
$multi_5 = $plugin_settings["enable_multipath_5"]

include ::nova::params

if ( $multi_0 == true) or ($multi_1 == true) or ($multi_2 == true) or ($multi_3 == true) or ($multi_4 == true) or ($multi_5 == true) {

package { sg3-utils: ensure => 'installed' }
package { multipath-tools: ensure => 'installed' }

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
}
