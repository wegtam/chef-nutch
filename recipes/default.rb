#
# Cookbook Name:: nutch
# Recipe:: default
#
# Copyright 2014, Wegtam UG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'ark'

# Create a user for nutch.
user "nutch" do
  comment "Nutch Crawler"
  home "/home/nutch"
  supports :manage_home => true
  action :create
end

# Add nutch to the hdfs group for hadoop usage.
group "hdfs" do
  append true
  members "nutch"
  action :modify
end

# Install ant to be able to compile nutch.
package "ant" do
  action :install
end

# Fetch our nutch source distribution.
ark "nutch-source" do
  url 'https://github.com/wegtam/nutch/archive/trunk.zip'
  path "/home/nutch"
  creates "nutch-source/build.xml"
  owner "nutch"
  group "nutch"
  action :put
end

# Create a `names.txt` for elasticsearch.
cookbook_file "names.txt" do
  path "/home/nutch/nutch-source/conf/names.txt"
  owner "nutch"
  group "nutch"
  action :create_if_missing
end

# Setup `nutch-site.xml`.
nutch_options = { :options => node['nutch']['nutch-site'] }
template "/home/nutch/nutch-source/conf/nutch-site.xml" do
  source "nutch-site.xml.erb"
  mode 0644
  owner "nutch"
  group "nutch"
  variables nutch_options
  action :create
end

# Build the ant runtime if not already done.
execute "ant runtime" do
  cwd "/home/nutch/nutch-source"
  user "nutch"
  group "nutch"
  action :run
  not_if { ::File.exists?("/home/nutch/nutch-source/runtime/deploy/bin/nutch") }
end

