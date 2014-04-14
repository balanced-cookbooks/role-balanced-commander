include_attribute 'role-balanced-commander'
return unless node.app_environment?('live')

default['rundeck']['proxy']['hostname'] = 'rundeck-live.balancedpayments.com'
default['rundeck']['proxy']['default'] = true
