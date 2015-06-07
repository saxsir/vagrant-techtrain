require 'spec_helper'

# jenkins
describe package('jenkins') do
  it { should be_installed }
end

describe service('jenkins') do
  it { should be_enabled }
  it { should be_running }
end

describe port(40218) do
  it { should be_listening }
end

describe iptables do
    it { should have_rule('-A INPUT -p tcp -m state --state NEW -m tcp --dport 40218 -j ACCEPT') }
end

describe file('/etc/sysconfig/jenkins') do
  it { should be_file }
  its(:content) { should match /^JENKINS_PORT="40218"/ }
end
