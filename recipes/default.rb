#
# Cookbook Name:: delphic_snapshots
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'delphic_aws::default'
include_recipe 'delphic_snapshots::credentials'
include_recipe 'delphic_snapshots::script_file'
include_recipe 'delphic_snapshots::cron'
