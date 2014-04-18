include_attribute 'role-balanced-commander'
return unless node.app_environment?('live')

default['rundeck']['proxy']['hostname'] = 'rundeck-live.balancedpayments.com'
default['rundeck']['proxy']['default'] = true

default['balanced-rundeck']['app_environment'] = 'live'

# TODO: remove setting this once we have prod db off of the legacy stacks
default['balanced-rundeck']['jobs']['db']['specify_host'] = true
default['balanced-rundeck']['jobs']['db']['archiver_query'] = 'roles:db-secondary-integration AND chef_environment:prod'
default['balanced-rundeck']['jobs']['db']['archiver_environment'] = 'integration'

override['postgres']['archiver'] = 'archiver-prod.db.vandelay.io'
