name "coreutils"
default_version "8.30"

version("8.30") { source md5: "ab06d68949758971fe744db66b572816" }

dependency "xz"

license "GPL-3.0"
license_file "COPYING"

source url: "http://ftp.gnu.org/gnu/coreutils/coreutils-#{version}.tar.xz"

# coreutils builds its libraries into a special directory. We need to include
# that directory in lib_dirs so omnibus can sign them during macOS deep signing.
lib_dirs lib_dirs.concat ["#{install_dir}/embedded/libexec/coreutils"]

relative_path "coreutils-#{version}"

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
