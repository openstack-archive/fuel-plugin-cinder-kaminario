class kaminario::controller_config{

$config_file='/etc/cinder/cinder.conf'
$plugin_settings = hiera('cinder_kaminario')

  if ($plugin_settings['filter_function_0'] != '') or ($plugin_settings['filter_function_1'] != '') or ($plugin_settings['filter_function_2'] != '') or ($plugin_settings['filter_function_3'] != '') or ($plugin_settings['filter_function_4'] != '') or ($plugin_settings['filter_function_5'] != '') 
  {
  ini_subsetting {'scheduler_default_filters':
    ensure               => present,
    section              => 'DEFAULT',
    key_val_separator    => '=',
    path                 => $config_file,
    setting              => 'scheduler_default_filters',
    subsetting           => 'DriverFilters',
    subsetting_separator => ',',
  }

  ini_subsetting {'scheduler_default_filter':
    ensure               => present,
    section              => 'DEFAULT',
    key_val_separator    => '=',
    path                 => $config_file,
    setting              => 'scheduler_default_filters',
    subsetting           => 'CapacityFilter',
    subsetting_separator => ',',
  }
  }
  cinder_config {
    'DEFAULT/default_volume_type'             : value => $default_volume_type
  }

service { 'cinder_api':
  ensure     => running,
  name       => cinder-api,
  enable     => true,
  hasstatus  => true,
  hasrestart => true,
}
Cinder_config<||> ~> Service['cinder-api']
}
