decrypted_aws = Chef::EncryptedDataBagItem.load('aws', "#{node['delphic_snapshots']['aws_account']}")

directory '/root/.aws' do
  action :create
end


template '/root/.aws/credentials' do
  source 'credentials.erb'
  mode   0600
  owner 'ubuntu'
  group 'ubuntu'
  variables({
    :Aws_Access_Key_Id      => "#{decrypted_aws['aws_access_key_id']}",
    :Aws_Secret_Access_Key  => "#{decrypted_aws['aws_secret_access_key']}"
  })
end

template '/root/.aws/config' do
  source 'config.erb'
  owner 'ubuntu'
  group 'ubuntu'
  mode 0600
end
