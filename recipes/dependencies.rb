#
# Cookbook Name:: cop_selenium
# Recipe:: dependencies
# Author:: Copious Inc. <engineering@copiousinc.com>
#

# Install OpenJDK
pkg = value_for_platform_family(
    rhel: 'java-1.8.0-openjdk',
    debian: 'openjdk-8-jre'
)

package pkg
