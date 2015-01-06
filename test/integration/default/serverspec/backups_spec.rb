# Encoding: utf-8

require 'spec_helper'

describe 'backups' do

  describe file('/home/steam/backups') do
    it { should be_directory }
    it { should be_mode 755 }
    it { should be_owned_by 'steam' }
    it { should be_grouped_into 'steam' }
  end

  # Should have directories with a specific format
  describe command('ls /home/steam/backups/7dtd_instance_01') do
    its(:stdout) { should match /\d{4}-\d{2}-\d{2}_\d{2}-\d{2}/ }
  end

  # Should have at most 5 backups
  #
  # This one is a little bit of a silly test since it won't really test the
  # outcome unless you run converge multiple times, but it is a nice quick and
  # automated way to confirm things are still working.
  describe command('ls /home/steam/backups/7dtd_instance_01 | wc -l') do
    its("stdout.to_i") { should be >= 1 }
    its("stdout.to_i") { should be <= 5 }
  end

end
