# Encoding: utf-8

require 'spec_helper'

describe 'sdtd' do

  describe package('lib32stdc++6') do
    it { should be_installed }
  end

  describe file('/home/steam/apps/294420/instances') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  describe file('/home/steam/apps/294420/instances/7dtd_instance_01') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  describe file('/home/steam/apps/294420/instances/7dtd_instance_01/config.xml') do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  describe file('/home/steam/apps/294420/instances/7dtd_instance_01/admins.xml') do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  describe file('/home/steam/apps/294420/7DaysToDie_Data/Managed/7dtd-server-fixes.dll') do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  describe file('/home/steam/apps/294420/7DaysToDie_Data/Managed/Assembly-CSharp.dll') do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  describe file('/etc/init/7dtd_26900.conf') do
    it { should be_file }
    its(:content) { should match 'description "7dtd_26900"' }
    its(:content) { should match 'sudo -u steam' }
  end

  describe service('7dtd_26900') do
    it { should be_enabled }
    it { should be_running.under('upstart') }
  end

end
