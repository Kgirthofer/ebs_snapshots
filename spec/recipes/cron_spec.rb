require 'spec_helper'

describe 'ebs_snapshots::cron' do
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
 
  context "force run true" do 
    let(:chef_run) do
      default_chef_run do |node|
        node.set['ebs_snapshots']['back_up_schedule']['force_run'] = true
      end
    end
    it { is_expected.to run_bash('force run') }
  end

  context "when backup daily is selected" do
    let(:chef_run) do
      default_chef_run do |node|
        node.set['ebs_snapshots']['back_up_schedule']['daily'] = true
      end
    end
    it { is_expected.to create_cron('snapshot_daily') }
  end

  context "when backup weekly is selected" do
    let(:chef_run) do
      default_chef_run do |node|
        node.set['ebs_snapshots']['back_up_schedule']['weekly'] = true
      end
    end
    it { is_expected.to create_cron('snapshot_weekly') }
  end

  context "when backup monthly is selected" do
    let(:chef_run) do
      default_chef_run do |node|
        node.set['ebs_snapshots']['back_up_schedule']['monthly'] = true
      end
    end
    it { is_expected.to create_cron('snapshot_monthly') }
  end
  
  context "when force run is true" do
    let(:chef_run) do
      default_chef_run do |node|
        node.set['ebs_snapshots']['back_up_schedule']['daily'] = true
      end
    end
    it { is_expected.to run_bash('force run') }
  end

  describe "ruby block" do
    it { is_expected.to run_ruby_block('set force_run') }
  end
end
