#
# Cookbook Name:: cop_selenium
# Recipe:: install
# Author:: Copious Inc. <engineering@copiousinc.com>
#

full_version  = node['selenium']['version']
short_version = full_version.to_f

remote_file node['selenium']['path'] do
    source "http://selenium-release.storage.googleapis.com/#{short_version}/selenium-server-standalone-#{full_version}.jar"
    owner  node['selenium']['owner']
    group  node['selenium']['group']
    mode   '0755'
    action :create
end
