#
# Cookbook Name:: chef-7dtd-server
# Recipe:: instance
#
# Copyright (C) 2014 Nicholas LaMuro
#
# All rights reserved - Do Not Redistribute
#


instance_dir = "#{node['sdtd']['instances_dir']}/#{node['sdtd']['instance_name']}"

sdtd_instance node['sdtd']['instance_name'] do
  instance_dir instance_dir
  server_config :SaveGameFolder => instance_dir
end
