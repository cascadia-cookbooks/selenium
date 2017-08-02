require 'spec_helper'

case os[:family]
when 'debian', 'ubuntu'
    pkg = 'openjdk-8-jre'
when 'redhat'
    pkg = 'java-1.8.0-openjdk'
end

describe 'selenium::default' do
    describe package(pkg) do
        it { should be_installed }
    end

    describe file('/opt/selenium-server-standalone.jar') do
        it { should exist }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
        it { should be_mode '755' }
    end
end
