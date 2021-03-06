include_attribute '7dtd-server::serveradmin'
include_attribute '7dtd-server::serverconfig'

default["sdtd"]["instances_dir"] = "#{node["steamcmd"]["apps_dir"]}/294420/instances"
default["sdtd"]["instance_name"] = "7dtd_instance_01"

default["sdtd"]["backups_dir"] = "#{node['steamcmd']['home']}/backups"
default["sdtd"]["compress_backups"] = true
