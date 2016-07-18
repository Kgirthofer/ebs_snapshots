require 'spec_helper'

describe 'delphic_snapshots::script_file' do
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
 
  describe "templates" do
    it { is_expected.to create_template'/opt/ec2-snapshots.sh' }
  end
end
