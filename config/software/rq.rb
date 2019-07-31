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

name "rq"
default_version "0.9.2"

version("0.9.2") { source sha256: "fbc9347d83ee575c10251ad2fff9c31a78c42d4cedc14bbb9be72739ed619496" }

license "GPL-3.0"
license_file "COPYING"

source url: "https://github.com/dflemstr/rq/releases/download/v#{version}/rq-x86_64-apple-darwin"

build do
  copy "#{project_dir}/rq-x86_64-apple-darwin", "#{install_dir}/embedded/bin/rq"
end
