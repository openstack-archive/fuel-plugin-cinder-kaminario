class kaminario::controller_config{

$config_file='/etc/cinder/cinder.conf'
$plugin_settings = hiera('cinder_kaminario')

  if $plugin_settings['scheduler_default_filters'] != ''
  {
  ini_subsetting {"scheduler_default_filters":
    ensure               => present,
    section              => 'DEFAULT',
    key_val_separator    => '=',
    path                 => $config_file,
    setting              => 'scheduler_default_filters',
    subsetting           => $plugin_settings['scheduler_default_filters'],
    subsetting_separator => ',',
  }
  }
  if $plugin_settings['scheduler_default_weighers'] != ''
  {
  cinder_config {
    "DEFAULT/scheduler_default_weighers"       : value => $plugin_settings['scheduler_default_weighers'];
  }
  }
  if $plugin_settings['rpc_response_timeout'] != ''
  {
  cinder_config {
    "DEFAULT/rpc_response_timeout"             : value => $plugin_settings['rpc_response_timeout'];
  }
  }

  cinder_config {
    "DEFAULT/default_volume_type"             : value => $default_volume_type
  }~> Exec[cinder_api]

exec {'cinder_api':
  command => '/usr/sbin/service cinder-api restart',}

}
