include_attribute '7dtd-server::serveradmin'
include_attribute '7dtd-server::serverconfig'

default["sdtd"]["instances_dir"] = "#{node["steamcmd"]["apps_dir"]}/294420/instances"
default["sdtd"]["instance_name"] = "7dtd_instance_01"
