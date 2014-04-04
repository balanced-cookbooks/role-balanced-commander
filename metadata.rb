name             'role-balanced-commander'
maintainer       'Balanced'
maintainer_email 'dev@balancedpayments.com'
license          'MIT'
description      'Installs/Configures commander nodes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

depends          'role-base', '~> 1.0'
depends          'balanced-devpi', '~> 1.0'
depends          'poise-appenv', '~> 1.0'
depends          'balanced', '~> 1.0.54'
depends          'balanced-rundeck', '~> 1.0.2'
