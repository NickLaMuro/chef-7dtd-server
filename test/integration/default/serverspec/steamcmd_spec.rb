# Encoding: utf-8

require 'spec_helper'

describe 'steamcmd' do

  describe user('steam') do
    it { should exist }
    it { should belong_to_group 'steam' }
    it { should have_home_directory '/home/steam' }
  end

  describe file('/opt/steamcmd') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  describe file('/home/steam/apps') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  describe file('/opt/steamcmd/steam.sh') do
    it { should be_file }
  end

  describe file('/opt/steamcmd/steamcmd.sh') do
    it { should be_file }
  end

  describe file('/opt/steamcmd/linux32') do
    it { should be_directory }
  end

  describe file('/tmp/steamcmd_linux.tar.gz') do
    it { should_not be_file }
    it { should_not be_directory }
  end

  describe file('/home/steam/7dtd') do
    it { should be_symlink }
  end

  describe file('/home/steam/apps/294420') do
    it { should be_directory }
  end
end
