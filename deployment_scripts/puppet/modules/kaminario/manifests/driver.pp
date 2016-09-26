class kaminario::driver{

file { '/usr/lib/python2.7/dist-packages/cinder/volume/drivers/kaminario':
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0755',}

file { '/usr/lib/python2.7/dist-packages/cinder/volume/drivers/kaminario/__init__.py':
        mode   => '0644',
        owner  => root,
        group  => root,
        source => 'puppet:///modules/kaminario/__init__.py'}

file { '/usr/lib/python2.7/dist-packages/cinder/volume/drivers/kaminario/kaminario_common.py':
        mode   => '0644',
        owner  => root,
        group  => root,
        source => 'puppet:///modules/kaminario/kaminario_common.py'}

file { '/usr/lib/python2.7/dist-packages/cinder/volume/drivers/kaminario/kaminario_fc.py':
        mode   => '0644',
        owner  => root,
        group  => root,
        source => 'puppet:///modules/kaminario/kaminario_fc.py'}

file { '/usr/lib/python2.7/dist-packages/cinder/volume/drivers/kaminario/kaminario_iscsi.py':
        mode   => '0644',
        owner  => root,
        group  => root,
        source => 'puppet:///modules/kaminario/kaminario_iscsi.py'}

file { '/usr/lib/python2.7/dist-packages/cinder/exception.py':
        mode   => '0644',
        owner  => root,
        group  => root,
        source => 'puppet:///modules/kaminario/exception.py'}

}
