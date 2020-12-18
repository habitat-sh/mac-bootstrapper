name "rq"
default_version "0.9.2"

version("0.9.2") { source sha256: "fbc9347d83ee575c10251ad2fff9c31a78c42d4cedc14bbb9be72739ed619496" }

license "GPL-3.0"
license_file "COPYING"

source url: "https://github.com/dflemstr/rq/releases/download/v#{version}/rq-x86_64-apple-darwin"

build do
  copy "#{project_dir}/rq-x86_64-apple-darwin", "#{install_dir}/embedded/bin/rq"
  command "chmod +x #{install_dir}/embedded/bin/rq"
end
