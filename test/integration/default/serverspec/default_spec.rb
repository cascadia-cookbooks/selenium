require 'spec_helper'

# Check which OS family the node belongs to (Red Hat, Debian)
case os[:family]
when 'redhat'
    pkg = 'java-1.8.0-openjdk'
when 'debian', 'ubuntu'
    case os[:release].to_i # Drop OS release minor version (no decimal)
    when 14, 8 # Ubuntu Trusty, Debian Jessie
        pkg = 'openjdk-7-jre'
    when 16, 9 # Ubuntu Xenial, Debian Stretch
        pkg = 'openjdk-8-jre'
    end
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
