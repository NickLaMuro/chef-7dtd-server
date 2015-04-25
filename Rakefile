#!/usr/bin/env rake

require 'yaml'

desc "Trigger a backup and download it"
task :backup => [:trigger_backup, :download_backup]

desc "Trigger a backup on the server"
task :trigger_backup do
  sh "cd #{vagrant_dir} && RECIPES=backup #{provision_cmd}"
end

desc "Download the most recent backup from the server"
task :download_backup do
  instance = ENV['INSTANCE_NAME'] || '7dtd_instance_01'
  instance_backup_dir = sdtd_config['instances_dir'] ? "#{sdtd_config['instances_dir']}/#{instance}" : "/home/steam/backups/#{instance}/"
  ssh_opts = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i $VAGRANT_IDENTITY -p $VAGRANT_PORT $VAGRANT_USER@$VAGRANT_HOSTNAME"

  sh <<-CMD.gsub(/^\s*/, '')
    cd #{vagrant_dir}
    VAGRANT_SSH_CONFIG=$(vagrant ssh-config)
    VAGRANT_USER=$(echo $VAGRANT_SSH_CONFIG | sed -e "s/.*User \\([a-z]*\\).*/\\1/")
    VAGRANT_PORT=$(echo $VAGRANT_SSH_CONFIG | sed -e "s/.*Port \\([0-9]*\\).*/\\1/")
    VAGRANT_HOSTNAME=$(echo $VAGRANT_SSH_CONFIG | sed -e "s/.*HostName \\([0-9\\.]*\\).*/\\1/")
    VAGRANT_IDENTITY=$(echo $VAGRANT_SSH_CONFIG | sed -e "s/.*IdentityFile \\([0-9a-zA-Z\\/\\._-]*\\).*/\\1/")

    VAGRANT_BACKUP_FILE=$(ssh #{ssh_opts} "ls #{instance_backup_dir} | sort | tail -1" 2>/dev/null)
    scp #{ssh_opts.gsub('-p', '-P')}:#{instance_backup_dir}/$VAGRANT_BACKUP_FILE #{backups_dir}/
  CMD
end

def vagrant_dir
  if ENV['KITCHEN']
    '.kitchen/kitchen-vagrant/default-ubuntu-1204'
  else
    '.'
  end
end

def provision_cmd
  if ENV['KITCHEN']
    "kitchen converge"
  else
    "vagrant provision"
  end
end

def instance_backup_dir
  if sdtd_config['instances_dir']
    "#{sdtd_config['instances_dir']}/#{instance}"
  else
    "/home/steam/backups/#{instance}/"
  end
end

def backups_dir
  if ENV['KITCHEN']
    File.dirname(__FILE__)
  else
    File.expand_path(File.join(File.dirname(__FILE__), 'cookbooks', '7dtd-server', 'files', 'default', 'backups'))
  end
end

def sdtd_config
  unless ENV['KITCHEN']
    chef_attributes = File.expand_path(File.join(File.dirname(__FILE__), 'chef_attributes.local.yml'))
    chef_attributes ? YAML.load_file(chef_attributes) : {}
  else
    {}
  end
end
