#
# Cookbook Name:: chef-7dtd-server
# Recipe:: default
#
# Copyright (C) 2014 Nicholas LaMuro
#
# All rights reserved - Do Not Redistribute
#

include_recipe '7dtd-server::install'
include_recipe '7dtd-server::instance'
