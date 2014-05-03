#
# Cookbook Name:: test_php-fpm
# Recipe:: default
#
# Copyright (C) 2014 
#
# 

include_recipe 'apt' if platform_family?('debian')
execute 'yum update -y -q' if platform_family?('rhel', 'fedora')

include_recipe 'php-fpm'
