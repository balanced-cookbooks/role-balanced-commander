include_attribute 'role-balanced-commander'
return unless (node.app_environment?('integration') or node.app_environment?('dev'))

default['rundeck']['proxy']['hostname'] = 'rundeck-integration.vandelay.io'
default['rundeck']['proxy']['port'] = 443
default['rundeck']['proxy']['scheme'] = 'https'
default['rundeck']['proxy']['default'] = true

override['rundeck']['external_scheme'] = 'https'
override['rundeck']['external_hostname'] = 'rundeck-integration.vandelay.io'
override['rundeck']['external_port'] = '443'

default['balanced-rundeck']['app_environment'] = 'integration'

default['balanced-rundeck']['jobs']['db']['specify_host'] = true
default['balanced-rundeck']['jobs']['db']['archiver_query'] = 'roles:db-secondary-integration AND chef_environment:prod'
default['balanced-rundeck']['jobs']['db']['archiver_environment'] = 'integration'

# db prod integration read slave
override['postgres']['archiver'] = 'db-prod-em9x8h-10-3-105-176.vandelay.io'
# specify the node to run the cluster backup on
default['balanced-rundeck']['jobs']['infra-db']['nodes'] = [
    {
        'name' => 'db-prod-em9x8h-10-3-105-176',
        'description' => 'db-prod-em9x8h-10-3-105-176',
        'roles' => ["db-secondary-#{node.app_environment}"],
        'recipes' => [],
        'fqdn' => 'db-prod-em9x8h-10-3-105-176.vandelay.io',
        'os' => '',
        'kernel_machine' => '',
        'kernel_name' => '',
        'kernel_release' => '',
    }
]
# specify the node to run the cluster backup on
default['balanced-rundeck']['jobs']['infra-db-cluster']['nodes'] = [
    {
        'name' => 'db-prod-2kn9p6-10-3-104-111',
        'description' => 'db-prod-2kn9p6-10-3-104-111',
        'roles' => ["db-primary-#{node.app_environment}"],
        'recipes' => [],
        'fqdn' => 'db-prod-2kn9p6-10-3-104-111.vandelay.io',
        'os' => '',
        'kernel_machine' => '',
        'kernel_name' => '',
        'kernel_release' => '',
    }
]
