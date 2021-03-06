include_attribute 'role-balanced-commander'
return unless node.app_environment?('live')

default['rundeck']['proxy']['hostname'] = 'rundeck-live.vandelay.io'
default['rundeck']['proxy']['port'] = 443
default['rundeck']['proxy']['scheme'] = 'https'
default['rundeck']['proxy']['default'] = true

override['rundeck']['external_scheme'] = 'https'
override['rundeck']['external_hostname'] = 'rundeck-live.vandelay.io'
override['rundeck']['external_port'] = '443'


default['balanced-rundeck']['app_environment'] = 'live'

default['balanced-rundeck']['jobs']['db']['specify_host'] = true
default['balanced-rundeck']['jobs']['db']['archiver_query'] = 'roles:db-secondary-integration AND chef_environment:prod'
default['balanced-rundeck']['jobs']['db']['archiver_environment'] = 'live'

# db prod live read slave
override['postgres']['archiver'] = 'db-prod-lu8spc-10-3-105-16.vandelay.io'
# specify the node to run the cluster backup on
default['balanced-rundeck']['jobs']['infra-db']['nodes'] = [
    {
        'name' => 'db-prod-lu8spc-10-3-105-16',
        'description' => 'db-prod-lu8spc-10-3-105-16',
        'roles' => ["db-secondary-#{node.app_environment}"],
        'recipes' => [],
        'fqdn' => 'db-prod-lu8spc-10-3-105-16.vandelay.io',
        'os' => '',
        'kernel_machine' => '',
        'kernel_name' => '',
        'kernel_release' => '',
    }
]
# specify the node to run the cluster backup on
default['balanced-rundeck']['jobs']['infra-db-cluster']['nodes'] = [
    {
        'name' => 'db-prod-ms47ox-10-3-105-192',
        'description' => 'db-prod-ms47ox-10-3-105-192',
        'roles' => ["db-primary-#{node.app_environment}"],
        'recipes' => [],
        'fqdn' => 'db-prod-ms47ox-10-3-105-192.vandelay.io',
        'os' => '',
        'kernel_machine' => '',
        'kernel_name' => '',
        'kernel_release' => '',
    }
]

# where should reports go:
# please be careful if you use a colon
override['rundeck-sql']['report_email_map'] = {
    'last_fancy_shadow_account_settlement_line_items.sql' => {
        'to' => ['tuch@fancy.com'],
        'from' => 'automated-reports@balancedpayments.com',
        'subject' => "Balanced Daily Report (#{DateTime.now.to_s.gsub(':', '-')}) for Fancy American Express Liabilities",
        'bcc' => ['reports@balancedpayments.com'],
        'body' => 'Automated report detailing American Express liabilities. Please See attached.'
    }
}