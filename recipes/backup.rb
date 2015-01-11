#
# Cookbook Name:: chef-7dtd-server
# Recipe:: backup
#
# Copyright (C) 2014 Nicholas LaMuro
#
# All rights reserved - Do Not Redistribute
#

sdtd_backup_instance node['sdtd']['instance_name'] do
  telnet_port node["sdtd"]["serverconfig"]["TelnetPort"]
  telnet_password node["sdtd"]["serverconfig"]["TelnetPassword"]
  backup_dir node["sdtd"]["backups_dir"]
  compress_backups node["sdtd"]["compress_backups"]
end
