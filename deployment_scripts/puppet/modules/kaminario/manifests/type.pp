class kaminario::type {
recursion { 'start':
    value => 5,
}

define recursion(
    $value
) {
    $plugin_settings = hiera('cinder_kaminario')

    kaminario_type {"plugin_${value}":
      create_type            =>      $plugin_settings["create_type_${value}"],
      options                =>      $plugin_settings["options_${value}"],
      backend_name           =>      $plugin_settings["backend_name_${value}"],
      type_name              =>      $plugin_settings["type_name_${value}"]
  }
    $minus1 = inline_template('<%= @value.to_i - 1 %>')
    if $minus1 < '0' {

  }  else {
        recursion { "value-${minus1}":
            value => $minus1,
        }
      }
}
}

define kaminario_type ($create_type,$options,$backend_name,$type_name) {
if $create_type == true {
case $options {
  'enable_replication_type': {
    cinder_type {$type_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:replication=enabled'],
    }
  }
  'enable_dedup': {
    cinder_type {$type_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:thin_prov_type=nodedup'],
    }
  }
  'replication_dedup': {
    cinder_type {$type_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:thin_prov_type=nodedup','kaminario:replication=enabled'],
    }
  }
  'default': {
    cinder_type {$type_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}"],
  }
  }

}

}

}
