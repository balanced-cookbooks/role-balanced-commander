include_attribute 'role-balanced-commander'
return unless node.app_environment?('live')

default['rundeck']['proxy']['hostname'] = 'rundeck-live.vandelay.io'
default['rundeck']['proxy']['port'] = 443
default['rundeck']['proxy']['scheme'] = 'https'
default['rundeck']['proxy']['default'] = true

default['balanced-rundeck']['app_environment'] = 'live'

default['balanced-rundeck']['jobs']['db']['specify_host'] = true
default['balanced-rundeck']['jobs']['db']['archiver_query'] = 'roles:db-secondary-integration AND chef_environment:prod'
default['balanced-rundeck']['jobs']['db']['archiver_environment'] = 'integration'

# db prod live read slave
override['postgres']['archiver'] = 'db-prod-lu8spc-10-3-105-67.vandelay.io'
# specify the node to run the cluster backup on
default['balanced-rundeck']['jobs']['db-infra-cluster']['nodes'] = [
    {
        'name' => 'db-prod-lu8spc-10-3-105-67.vandelay.io',
        'description' => 'db-prod-lu8spc-10-3-105-67.vandelay.io',
        'roles' => [],
        'recipes' => [],
        'fqdn' => 'db-prod-lu8spc-10-3-105-67.vandelay.io',
        'os' => '',
        'kernel_machine' => '',
        'kernel_name' => '',
        'kernel_release' => '',
    }
]
