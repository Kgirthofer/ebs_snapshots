template '/opt/ec2-snapshots.sh' do
  source 'ec2-snapshots.sh.erb'
  mode   '0755'
  owner  'root'
  group  'root'
  variables({
    :Retention_Days => node['delphic_snapshots']['retention_days']
  })
end


