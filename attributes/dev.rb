include_attribute 'role-balanced-commander'
return unless node.app_environment?('dev')

default['balanced-rundeck']['app_environment'] = 'dev'
