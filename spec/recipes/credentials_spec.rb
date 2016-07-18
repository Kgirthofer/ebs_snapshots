require 'spec_helper'

describe 'delphic_snapshots::credentials' do
  cached(:chef_run) do
    default_chef_run do |node|
    end
  end

  subject { chef_run }

  before :each do
    stub_command(/.*/).and_return true
    allow(Chef::EncryptedDataBagItem).to receive(:load).and_return(
      'decrypted_aws' => {}
    )
  end
 
  describe "directories" do
    it {is_expected.to create_directory('/root/.aws')}
  end

  describe "templates" do
    it { is_expected.to create_template'/root/.aws/config' }
    it { is_expected.to create_template'/root/.aws/credentials' }
  end
end
