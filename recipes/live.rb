include_recipe 'role-balanced-commander'

# until we've had a chance to confirm that invoicing can run on balanced
# integration boxes and not fuck us, we only run these in the live environment.
include_recipe 'balanced::jobs'
include_recipe 'precog::jobs'
include_recipe 'rundeck-sql'
include_recipe 'balanced-rundeck::ops'
