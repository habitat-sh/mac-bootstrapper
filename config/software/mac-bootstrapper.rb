#
# Copyright 2018, Chef Software, Inc.
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

name "mac-bootstrapper"
default_version "1.0.0"

license :project_license

dependency "bash"
dependency "gtar"
dependency "libiconv"
dependency "libsodium"
dependency "bzip2"
dependency "xz"
dependency "openssl"
dependency "libarchive"
dependency "expat"
dependency "coreutils"
dependency "cacerts"
dependency "rq"

# Libcharset is safe to rely on as it's part of OSX
whitelist_file /libarchive\..+/
