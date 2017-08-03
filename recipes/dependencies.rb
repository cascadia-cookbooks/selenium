#
# Cookbook Name:: cop_selenium
# Recipe:: dependencies
# Author:: Copious Inc. <engineering@copiousinc.com>
#

# Install OpenJDK
case node['platform_family']
when 'rhel'
    pkg = 'java-1.8.0-openjdk'
when 'debian'
    case node['lsb']['codename']
    when 'jessie', 'trusty'
        pkg = 'openjdk-7-jre'
    when 'stretch', 'xenial'
        pkg = 'openjdk-8-jre'
    end
end

package pkg
