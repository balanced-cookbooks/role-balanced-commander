default['poise-appenv']['cookbook'] = 'role-balanced-commander'

override['balanced-apt']['allow_unstable'] = node.chef_environment == 'test'

default['rundeck']['port']              = 4440
default['rundeck']['hostname']          = '127.0.0.1'

override['balanced']['jobs']['failure_recipient'] = 'cron+balanced@balancedpayments.com'
default['balanced']['jobs']['failure_notify_url'] = 'https://cron.vandelay.io'

override['precog']['jobs']['failure_recipient'] = 'cron+precog@balancedpayments.com'
default['precog']['jobs']['failure_notify_url'] = 'https://cron.vandelay.io'

override['balanced-rundeck']['jobs']['failure_recipient'] = 'cron+infra@balancedpayments.com'
default['balanced-rundeck']['jobs']['failure_notify_url'] = 'https://cron.vandelay.io'

# rundeck-sql
default['rundeck-sql']['failure_email'] = 'risk+reports@balancedpayments.com'
default['rundeck-sql']['failure_url'] = 'https://cron.vandelay.io'
default['rundeck-sql']['success_email'] = 'risk+reports@balancedpayments.com'
default['rundeck-sql']['success_url'] = 'https://cron.vandelay.io'
