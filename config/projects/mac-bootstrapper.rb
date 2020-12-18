name "mac-bootstrapper"
friendly_name "Habitat macOS Bootstrapper"
maintainer "Chef Software Inc"
homepage   "https://www.chef.io"
license "Apache-2.0"
license_file "LICENSE"

build_iteration 1
# Do not use __FILE__ after this point, use current_file. If you use __FILE__
# after this point, any dependent defs that
# use instance_eval will fail to work correctly.
current_file ||= __FILE__
version_file = File.expand_path("../../../VERSION", current_file)
build_version IO.read(version_file).strip

install_dir "#{default_root}/#{name}"

# creates required build directories
dependency "preparation"

# Split the toolchain defs into their own software def so we can have
# a custom whitelist
dependency "mac-bootstrapper"

exclude '\.git*'
exclude 'bundler\/git'

package :pkg do
  identifier "com.getchef.pkg.mac-bootstrapper"
  signing_identity "Chef Software, Inc. (EU3VF8YLX2)"
end
compress :dmg
