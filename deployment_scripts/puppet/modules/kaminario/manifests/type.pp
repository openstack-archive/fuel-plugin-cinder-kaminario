class kaminario::type {
$num = [ '0', '1', '2', '3', '4', '5' ]
$plugin_settings = hiera('cinder_kaminario')
each($num) |$value| {
kaminario_type {"plugin_${value}":
  create_type            =>      $plugin_settings["create_type_${value}"],
  options                =>      $plugin_settings["options_${value}"],
  backend_name           =>      $plugin_settings["backend_name_${value}"]
  }
}
}

define kaminario_type ($create_type,$options,$backend_name) {
if $create_type == true {
case $options {
  "enable_replication_type": {
    cinder_type {$backend_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:replication=enabled'],
    }
  }
  "enable_dedup": {
    cinder_type {$backend_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:thin_prov_type=nodedup'],
    }
  }
  "replication_dedup": {
    cinder_type {$backend_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:thin_prov_type=nodedup','kaminario:thin_prov_type=nodedup'],
    }
  }
  "default": {
    cinder_type {$backend_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}"],
   }
  }

}

}

}
