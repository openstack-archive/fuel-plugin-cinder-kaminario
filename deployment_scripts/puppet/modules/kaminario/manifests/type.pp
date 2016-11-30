class kaminario::type {
recursion { 'start':
    value => 5,
}

define recursion(
    $value
) {
    $plugin_settings = hiera('cinder_kaminario')
    kaminario_type {"plugin_${value}":
      create_type            	=>      $plugin_settings["create_type_${value}"],
      backend_name           	=>      $plugin_settings["type_backendname_${value}"],
      type_enable_replication	=>      $plugin_settings["type_enable_replication_${value}"],
      enable_nodedup            =>	$plugin_settings["enable_nodedup_${value}"],
      type_name              	=>      $plugin_settings["type_name_${value}"]
  }
    $minus1 = inline_template('<%= @value.to_i - 1 %>')
    if "${minus1}" < '0' {
        
   }  else {
        recursion { "value-${minus1}":
            value => $minus1,
        }
    }
}
}

define kaminario_type ($create_type,$backend_name,$type_name,$enable_nodedup,$type_enable_replication) {
if $create_type == true {
if ($enable_nodedup == true) and ($type_enable_replication == false) {
    cinder_type {$type_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}"],
    }
}
if ($type_enable_replication == true) and ($enable_nodedup == false) {
    cinder_type {$type_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:replication=enabled', 'kaminario:thin_prov_type=nodedup'],
    }
}
if ($type_enable_replication == true) and ($enable_nodedup == true) {
    cinder_type {$type_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:replication=enabled'],
    }
}

if ($type_enable_replication == false) and ($enable_nodedup == false) {

    cinder_type {$type_name:
      ensure     => present,
      properties => ["volume_backend_name=${backend_name}",'kaminario:thin_prov_type=nodedup'],
   }
}
}
}

