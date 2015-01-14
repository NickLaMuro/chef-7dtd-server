#!/usr/bin/env rake

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

desc "Trigger a backup and download it"
task :backup => [:trigger_backup, :download_backup]

desc "Trigger a backup on the server"
task :trigger_backup do
  if ENV['KITCHEN']
    sh "RECIPES=backup #{provision_cmd}"
  else
    sh "cd #{vagrant_dir} && #{provision_cmd}"
  end
end

desc "Download the most recent backup from the server"
task :download_backup do
  current_dir = File.dirname(__FILE__)
  instance_backup_dir = "/home/steam/backups/7dtd_instance_01/"
  ssh_opts = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i $VAGRANT_IDENTITY -p $VAGRANT_PORT $VAGRANT_USER@$VAGRANT_HOSTNAME"

  sh <<-CMD.gsub(/^\s*/, '')
    cd #{vagrant_dir} &&
    VAGRANT_SSH_CONFIG=$(vagrant ssh-config) &&
    VAGRANT_USER=$(echo $VAGRANT_SSH_CONFIG | sed -e "s/.*User \\([a-z]*\\).*/\\1/") &&
    VAGRANT_PORT=$(echo $VAGRANT_SSH_CONFIG | sed -e "s/.*Port \\([0-9]*\\).*/\\1/") &&
    VAGRANT_HOSTNAME=$(echo $VAGRANT_SSH_CONFIG | sed -e "s/.*HostName \\([0-9\\.]*\\).*/\\1/") &&
    VAGRANT_IDENTITY=$(echo $VAGRANT_SSH_CONFIG | sed -e "s/.*IdentityFile \\([0-9a-zA-Z\\/\\._-]*\\).*/\\1/")

    VAGRANT_BACKUP_FILE=$(ssh #{ssh_opts} "ls #{instance_backup_dir} | sort -r | tail -1" 2>/dev/null)
    scp #{ssh_opts.gsub('-p', '-P')}:#{instance_backup_dir}/$VAGRANT_BACKUP_FILE #{current_dir}/
  CMD
end
