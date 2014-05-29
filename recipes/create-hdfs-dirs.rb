#
# Cookbook Name:: nutch
# Recipe:: create-hdfs-dirs
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

# Create the users directories.
execute "hdfs users dir" do
  command "hdfs dfs -mkdir /user"
  user "hdfs"
  group "hdfs"
  action :run
  not_if 'hdfs dfs -test -d /user', :user => 'hdfs'
end

execute "hdfs nutch dir" do
  command "hdfs dfs -mkdir /user/nutch"
  user "hdfs"
  group "hdfs"
  action :run
  not_if 'hdfs dfs -test -d /user/nutch', :user => 'hdfs'
end

execute "hdfs chown nutch dir" do
  command "hdfs dfs -chown nutch /user/nutch"
  user "hdfs"
  group "hdfs"
  action :run
end

