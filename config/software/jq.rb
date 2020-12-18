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
