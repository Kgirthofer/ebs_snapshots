cron 'snapshot_daily' do
  command '/opt/ec2-snapshots.sh'
  minute  node['delphic_snapshots']['cron']['minute']
  hour    node['delphic_snapshots']['cron']['hour']
  only_if { node['delphic_snapshots']['back_up_schedule']['daily'] }
end

cron 'snapshot_weekly' do
  command     '/opt/ec2-snapshots.sh'
  minute      node['delphic_snapshots']['cron']['minute']
  hour        node['delphic_snapshots']['cron']['hour']
  weekday     node['delphic_snapshots']['cron']['week_day']
  only_if { node['delphic_snapshots']['back_up_schedule']['weekly'] }
end

cron 'snapshot_monthly' do
  command '/opt/ec2-snapshots.sh'
  minute  node['delphic_snapshots']['cron']['minute']
  hour    node['delphic_snapshots']['cron']['hour']
  day     node['delphic_snapshots']['cron']['day']
  only_if { node['delphic_snapshots']['back_up_schedule']['monthly'] }
end

bash 'force run' do
  cwd '/opt'
  user 'root'
  environment ({'HOME' => '/root', 'USER' => 'root'})
  code <<-EOH
  ./ec2-snapshots.sh
  EOH
  only_if { node['delphic_snapshots']['back_up_schedule']['force_run'] }
end

ruby_block 'set force_run' do
  block do
    node.set['delphic_snapshots']['back_up_schedule']['force_run'] = false
    node.save
  end
  action :run
end
