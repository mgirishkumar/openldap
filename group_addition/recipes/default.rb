#
# Cookbook Name:: group_addition
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group "techops_dba"

ruby_block "insert group in security.conf" do
  block do
    file = Chef::Util::FileEdit.new("/etc/security/access.conf")
    file.insert_line_if_no_match(/techops_dba/, "+ : techops_dba : ALL")
    file.write_file
  end
end


sudo "techops_dba" do
	group "techops_dba"
	nopasswd true
end
