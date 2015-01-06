#
# Cookbook Name:: chef-7dtd-server
# Recipe:: install
#
# Copyright (C) 2014 Nicholas LaMuro
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
package 'xmlstarlet'
package 'lib32stdc++6'

steamcmd_app '7dtd' do
  app_id 294420
  app_name '7dtd'
  username "#{node[:sdtd][:steam_username]}"
  password "#{node[:sdtd][:steam_password]}"
  use_upstart false
  retries 10
end

user node['steamcmd']['user'] do
  gid node['steamcmd']['group']
  home node['steamcmd']['home']
  system true
  shell '/bin/bash'
  action :create
  supports :manage_home => true
end


# Server Fixes

dll_folder = "#{node['steamcmd']['apps_dir']}/294420/7DaysToDie_Data/Managed"

cookbook_file "#{dll_folder}/7dtd-server-fixes.dll" do
  source '7dtd-server-fixes.dll'
  owner node['steamcmd']['user']
  group node['steamcmd']['group']
  mode '0755'
  action :create
end

cookbook_file "#{dll_folder}/Assembly-CSharp.dll" do
  source 'Assembly-CSharp.dll'
  owner node['steamcmd']['user']
  group node['steamcmd']['group']
  mode '0755'
  action :create
end
