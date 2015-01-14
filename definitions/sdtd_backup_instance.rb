define :sdtd_backup_instance, :telnet_port => nil, :telnet_password => nil, :save_wait_time => 10,
                              :backup_naming_format => '$(date "+%Y-%m-%d_%H-%M-%S")', :backups_to_keep => 5,
                              :backup_dir => nil, :instance_name => nil do

  instance_name = params[:instance_name] || params[:name]
  instance_backup_dir = "#{params[:backup_dir]}/#{instance_name}"

  directory params[:backup_dir] do
    owner node['steamcmd']['user']
    group node['steamcmd']['group']
    mode '0755'
    recursive true
    action :create
  end

  directory instance_backup_dir do
    owner node['steamcmd']['user']
    group node['steamcmd']['group']
    mode '0755'
    recursive true
  end

  execute 'save instance via telnet' do
    command <<-CMD
      {
        sleep 1
        echo #{params[:telnet_password]}
        sleep 2
        echo saveworld
        sleep #{params[:save_wait_time]}
        echo exit
      } | telnet 127.0.0.1 #{params[:telnet_port]}
    CMD
    returns [0,1] # Allow exit status of 1 here
  end

  execute 'backup instance directory' do
    command <<-CMD
      export BACKUP_DATE=#{params[:backup_naming_format]}
      rsync -a --delete --numeric-ids --delete-excluded /home/steam/apps/294420/instances/#{instance_name}/./ #{instance_backup_dir}/$BACKUP_DATE
      #{"cd #{instance_backup_dir} && tar -czvf $BACKUP_DATE.tar.gz $BACKUP_DATE && rm -rf $BACKUP_DATE" if params[:compress_backups]}
      ls #{instance_backup_dir}/ | sort -r | tail -n +#{params[:backups_to_keep] + 1} | xargs -I {} rm -rf #{instance_backup_dir}/{}
    CMD
  end

end
