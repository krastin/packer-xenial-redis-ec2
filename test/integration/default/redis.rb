describe service('redis-server') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
end

describe user('redis') do
    it { should exist }
    its('group') { should eq 'redis' }
    its('home') { should eq '/home/redis' }
end