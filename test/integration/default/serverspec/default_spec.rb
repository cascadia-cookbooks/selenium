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

end
