module Puppet::Parser::Functions
  newfunction(:section_name, :type => :rvalue) do |args|
    ip = args[0]
    str = args[1]
    sec_name = str + '_' + ip
    return sec_name
  end
end

