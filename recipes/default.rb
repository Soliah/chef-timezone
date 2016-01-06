#
# Cookbook Name:: timezone
# Recipe:: default
#

package "tzdata" do
  action :install
end

execute "update_tzdata" do
  command "dpkg-reconfigure -f noninteractive tzdata"
  action :nothing
end

file "/etc/timezone" do
  owner "root"
  group "root"
  mode "00644"
  content node["timezone"]["zone"]
  notifies :run, "execute[update_tzdata]"
end
