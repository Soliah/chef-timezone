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

template "/etc/timezone" do
  owner "root"
  group "root"
  mode "00644"
  source "timezone.erb"
  notifies :run, "execute[update_tzdata]", :delayed
end
