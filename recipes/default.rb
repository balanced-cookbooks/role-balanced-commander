node.override[:devpi][:client][:password] = citadel['omnibus/devpi_password'].strip

include_recipe 'role-base'
include_recipe 'balanced-devpi::configure_clients'
include_recipe 'balanced-rundeck'
include_recipe 'balanced-rundeck::client'
include_recipe 'balanced::jobs'

rundeck_user 'balanced' do
  password citadel['balanced/rundeck.password']
  roles %w{admin user}
end
