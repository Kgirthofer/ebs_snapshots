#
# Cookbook Name:: ebs_snapshots
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'aws_cli::default'
include_recipe 'ebs_snapshots::credentials'
include_recipe 'ebs_snapshots::script_file'
include_recipe 'ebs_snapshots::cron'
