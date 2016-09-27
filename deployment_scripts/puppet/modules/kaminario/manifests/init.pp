class kaminario::config {
$num = [ '0', '1', '2', '3', '4', '5' ]
$plugin_settings = hiera('cinder_kaminario')
each($num) |$value| {
config {"plugin_${value}":
  add_backend            =>      $plugin_settings["add_backend_${value}"],
  cinder_node            =>      $plugin_settings["cinder_node_${value}"],
  storage_protocol       =>      $plugin_settings["storage_protocol_${value}"],
  backend_name           =>      $plugin_settings["backend_name_${value}"],
  storage_user           =>      $plugin_settings["storage_user_${value}"],
  storage_password       =>      $plugin_settings["storage_password_${value}"],
  storage_ip             =>      $plugin_settings["storage_ip_${value}"],
  enable_replication     =>      $plugin_settings["enable_replication_${value}"],
  replication_ip         =>      $plugin_settings["replication_ip_${value}"],
  replication_login      =>      $plugin_settings["replication_login_${value}"],
  replication_rpo        =>      $plugin_settings["replication_rpo_${value}"],
  replication_password   =>      $plugin_settings["replication_password_${value}"],
  enable_multipath       =>      $plugin_settings["enable_multipath_${value}"],
  suppress_logs          =>      $plugin_settings["suppress_logs_${value}"],
  filter_function        =>      $plugin_settings["filter_function_${value}"],
  oversubscription_ratio =>      $plugin_settings["oversubscription_ratio_${value}"],
  num                    =>      $value
  }
}
}

define config($add_backend,$storage_protocol,$backend_name,$storage_user,$storage_password,$storage_ip,$num,$cinder_node,$enable_replication,$replication_ip,$replication_login,$replication_rpo,$replication_password,$enable_multipath,$suppress_logs,$filter_function,$oversubscription_ratio) {

  $sec_name = section_name( $storage_ip , $backend_name )
  $config_file = "/etc/cinder/cinder.conf"
  if $cinder_node == hiera(user_node_name) {
  if $add_backend == true {
  if $storage_protocol == 'FC'{

  ini_subsetting {"enable_backend_${num}":
        ensure               => present,
        section              => 'DEFAULT',
        key_val_separator    => '=',
        path                 => $config_file,
        setting              => 'enabled_backends',
        subsetting           => $backend_name,
        subsetting_separator => ',',
   }->
    cinder_config {
        "$sec_name/volume_driver"       : value => "cinder.volume.drivers.kaminario.kaminario_fc.KaminarioFCDriver";
        "$sec_name/volume_backend_name" : value => $backend_name;
        "$sec_name/san_ip"              : value => $storage_ip;
        "$sec_name/san_login"           : value => $storage_user;
        "$sec_name/san_password"        : value => $storage_password;
        "$sec_name/filter_function"     : value => $filter_function;
   }

    if $enable_replication == true {
    $replication_device = get_replication_device($replication_ip, $replication_login , $replication_password , $replication_rpo)
    cinder_config {
        "$sec_name/replication_device"       : value => $replication_device;
    }
    }
 
    if $enable_multipath == true {
    cinder_config {
        "$sec_name/use_multipath_for_image_xfer"           : value => "True";
        "$sec_name/enforce_multipath_for_image_xfer"       : value => "True";
    }   
    }
    if $suppress_logs == true {
    cinder_config {
        "$sec_name/suppress_requests_ssl_warnings"         : value => "True";
    }
    }

    if $oversubscription_ratio == true {
    cinder_config {
        "$sec_name/auto_calc_max_oversubscription_ratio"   : value => "True";
    }
    }

}
  if $storage_protocol == 'ISCSI'{
  ini_subsetting {"enable_backend_${num}":
        ensure               => present,
        section              => 'DEFAULT',
        key_val_separator    => '=',
        path                 => $config_file,
        setting              => 'enabled_backends',
        subsetting           => $backend_name,
        subsetting_separator => ',',
   }->
    cinder_config {
        "$sec_name/volume_driver"       : value => "cinder.volume.drivers.kaminario.kaminario_iscsi.KaminarioISCSIDriver";
        "$sec_name/volume_backend_name" : value => $backend_name;
        "$sec_name/san_ip"              : value => $storage_ip;
        "$sec_name/san_login"           : value => $storage_user;
        "$sec_name/san_password"        : value => $storage_password;
        "$sec_name/filter_function"     : value => $filter_function;
   }

    if $enable_replication == true {
    $replication_device = get_replication_device($replication_ip, $replication_login , $replication_password , $replication_rpo)
    cinder_config {
        "$sec_name/replication_device"       : value => $replication_device;
    }
    }
    if $enable_multipath == true {
    cinder_config {
        "$sec_name/use_multipath_for_image_xfer"           : value => "True";
        "$sec_name/enforce_multipath_for_image_xfer"       : value => "True";
    }
    }
    if $suppress_logs == true {
    cinder_config {
        "$sec_name/suppress_requests_ssl_warnings"         : value => "True";
    }
    }
    if $oversubscription_ratio == true {
    cinder_config {
        "$sec_name/auto_calc_max_oversubscription_ratio"  : value => "True";
    }
    }

}
}
}
}

