require 'hiera'
require 'facter'
Facter.add("default_volume_type") do
  hiera = Hiera.new(:config => '/etc/hiera.yaml')
  cinder_kaminario=hiera.lookup('cinder_kaminario', {}, {},'nil')
  5.times do |i|
    default_type = "default_type_" + i.to_s
    type_name  = "type_name_" + i.to_s
      if cinder_kaminario[default_type] == true
        default_type = cinder_kaminario[type_name]
        setcode do
          default_type
        end
        break
      end
  end
end

