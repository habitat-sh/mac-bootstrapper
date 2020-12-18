name "xz"
default_version "5.2.4"

version("5.2.4") { source md5: "5ace3264bdd00c65eeec2891346f65e6" }

license "GPL-3.0"
license_file "COPYING"

source url: "https://tukaani.org/xz/xz-#{version}.tar.gz"

relative_path "xz-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure_command = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
  ]

  command configure_command.join(" "), env: env
  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
