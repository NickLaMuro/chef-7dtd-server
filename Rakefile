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

desc "Trigger a backup on the server"
task :trigger_backup do
  if ENV['KITCHEN']
    sh "RECIPES=backup #{provision_cmd}"
  else
    sh "cd #{vagrant_dir} && #{provision_cmd}"
  end
end
