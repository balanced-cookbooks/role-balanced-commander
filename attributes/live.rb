include_attribute 'role-balanced-commander'
return unless node.app_environment?('live')

default['rundeck']['proxy']['hostname'] = 'rundeck-live.balancedpayments.com'
default['rundeck']['proxy']['default'] = true
default['balanced-rundeck']['app_environment'] = 'live'
override['postgres']['archiver'] = 'archiver-prod.db.vandelay.io'
