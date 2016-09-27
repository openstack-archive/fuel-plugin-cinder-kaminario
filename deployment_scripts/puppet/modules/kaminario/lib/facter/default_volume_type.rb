require 'hiera'
require 'facter'
hiera = Hiera.new(:config => '/etc/hiera.yaml')
cinder_kaminario=hiera.lookup('cinder_kaminario', {}, {},'nil')
5.times do |i|
  add_backend = "add_backend_" + i.to_s
  type_name  = "type_name_" + i.to_s
    if cinder_kaminario[add_backend] == true
      default_type = cinder_kaminario[type_name]
  end
end

Facter.add("default_volume_type") do
  setcode do
    default_type
  end
end

