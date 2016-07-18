require 'spec_helper'
## see https://github.com/sethvargo/chefspec

# using chef client or another WIN32OLE dependent cookbook?
# require 'radian/chef/win32ole_chefspec_linux.rb'

describe 'ebs_snapshots::default' do
  cached(:chef_run) { default_chef_run }
  subject { chef_run }

  before :each do
    stub_command(/.*/).and_return true
    # need to stub out a data bag? see .kitchen.yml too.
    allow(Chef::EncryptedDataBagItem).to receive(:load).and_return 'stuff'
  end

  describe 'included recipies' do
    it { is_expected.to include_recipe 'aws_cli::default' }
    it { is_expected.to include_recipe 'ebs_snapshots::credentials' }
    it { is_expected.to include_recipe 'ebs_snapshots::script_file' }
    it { is_expected.to include_recipe 'ebs_snapshots::cron' }
  end
end
