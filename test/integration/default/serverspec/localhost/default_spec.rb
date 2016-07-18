require 'spec_helper'

## see http://serverspec.org/
describe file ('/root/.aws/credentials') do
  it { should be_file  }
end

describe file ('/opt/ec2-snapshots.sh') do
  it { should be_file }
end

