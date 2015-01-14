define :sdtd_instance, :server_config => {}, :admin_config => {}, :SaveGameFolder => nil, :upstart_exec_opts => nil do
  instance_dir = params[:instance_dir] || "#{node['sdtd']['instances_dir']}/#{params[:name]}"
  params[:server_config][:SaveGameFolder] = params[:SaveGameFolder] || instance_dir

  directory node['sdtd']['instances_dir'] do
    owner node['steamcmd']['user']
    group node['steamcmd']['group']
    mode '0755'
    action :create
  end

  directory instance_dir do
    owner node['steamcmd']['user']
    group node['steamcmd']['group']
    mode '0755'
    action :create
  end

  backup_file = node['sdtd'].fetch('upload_backup', {})[params[:name]]
  if backup_file
    cookbook_file "/tmp/#{backup_file}" do
      source "backups/#{backup_file}"
      cookbook node['sdtd']['upload_backup_cookbook'] || '7dtd-server'
      owner node['steamcmd']['user']
      group node['steamcmd']['group']
      mode '0755'
      action :create
    end


    execute 'backup instance directory' do
      command <<-CMD
        tar --strip-components=1 -xzvf /tmp/#{backup_file} -C #{instance_dir} &&
        chown #{node['steamcmd']['user']}:#{node['steamcmd']['group']} -R #{instance_dir}
      CMD
    end
  end

  config_variables = node['sdtd']['serverconfig'].merge(params[:server_config])

  template "#{instance_dir}/config.xml" do
    source 'serverconfig.xml.erb'
    owner node['steamcmd']['user']
    group node['steamcmd']['group']
    mode '0755'
    action :create
    variables(:config_variables => config_variables)
  end


  admin_variables = node['sdtd']['serveradmin'].merge(params[:admin_config])

  template "#{instance_dir}/admins.xml" do
    source 'serveradmin.xml.erb'
    owner node['steamcmd']['user']
    group node['steamcmd']['group']
    mode '0755'
    action :create
    variables admin_variables
  end

  # Upstart

  exec_opts = params[:upstart_exec_opts] || "-- -logfile #{instance_dir}/7dtd.log -configfile=#{instance_dir}/config.xml"
  instance_service = "7dtd_#{config_variables['ServerPort']}"

  template "/etc/init/#{instance_service}.conf" do
    mode '0644'
    source 'upstart.erb'
    variables :exec_opts => exec_opts, :description => instance_service
    notifies :restart, "service[#{instance_service}]"
  end

  service instance_service do
    provider Chef::Provider::Service::Upstart
    supports :restart => true, :reload => false, :status => false
    action [ :enable, :start ]
  end

end
