include_attribute 'role-balanced-commander'
return unless node.app_environment?('dev')

default['rundeck']['proxy']['hostname'] = 'rundeck-dev.balancedpayments.com'
default['rundeck']['proxy']['port'] = 4441
default['rundeck']['proxy']['scheme'] = 'http'
default['rundeck']['proxy']['default'] = true
default['balanced-rundeck']['app_environment'] = 'dev'
