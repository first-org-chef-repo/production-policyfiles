# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

name 'db-server'
default_source :chef_server, 'https://automate.cl/organizations/first-org'
run_list 'bootstrap_a_node::default', 'postgresql_setup::default', 'ssh_setup::default'
cookbook 'bootstrap_a_node', '1.0.0'
cookbook 'postgresql_setup', '1.0.0'
cookbook 'ssh_setup', '2.0.0'

##########
# Attributes
##########

# Specify CCR interval and splay
override['chef_client']['interval'] = 3600 #86400 # 24H
override['chef_client']['splay'] = 600 # 1H

# Specify Policy name & Policy group
override['bootstrap_a_node']['policy_name'] = 'db-server'
override['bootstrap_a_node']['policy_group'] = 'production'

# Specify chef-client version
override['bootstrap_a_node']['chef_client']['version'] = '16.10'

# Disable Slack Notification that's set only for the initial CCR
override['chef_client']['handler']['slack']['enabled'] = false
# Specify node Time Zone
override['bootstrap_a_node']['timezone'] = 'Asia/Tokyo'
