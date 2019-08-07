#
# Copyright 2016 Chef Software, Inc.
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

name "jq"
default_version "1.6"

version("1.6") { source sha256: "5c0a0a3ea600f302ee458b30317425dd9632d1ad8882259fcaf4e9b868b2b1ef" }

license "MIT"
license_file "COPYING"
source url: "https://github.com/stedolan/jq/releases/download/jq-#{version}/jq-osx-amd64"

build do
  copy "#{project_dir}/jq-osx-amd64", "#{install_dir}/embedded/bin/jq"
  command "chmod +x #{install_dir}/embedded/bin/jq"
end
