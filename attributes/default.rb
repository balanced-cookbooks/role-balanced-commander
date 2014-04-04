default['poise-appenv']['cookbook'] = 'role-balanced-commander'

override['balanced-apt']['allow_unstable'] = node.chef_environment == 'test'

default['rundeck']['port']              = 4440
default['rundeck']['hostname']          = '127.0.0.1'
