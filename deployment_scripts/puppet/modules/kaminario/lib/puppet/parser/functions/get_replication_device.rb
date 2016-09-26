module Puppet::Parser::Functions
  newfunction(:get_replication_device, :type => :rvalue) do |args|
    ip = args[0].to_s
    login = args[1]
    password = args[2]
    rpo = args[3]
    replication_device = 'backend_id' + ':' + ip + ","  + 'login' + ':' + login + "," +  'password' + ':' + password + "," + 'rpo' + ':' + rpo
    return replication_device
  end
end

