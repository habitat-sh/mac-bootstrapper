name "mac-bootstrapper"
default_version "1.0.0"

license :project_license

dependency "bash"
dependency "gtar"
dependency "libsodium"
dependency "bzip2"
dependency "xz"
dependency "openssl"
dependency "libarchive"
dependency "expat"
dependency "coreutils"
dependency "cacerts"
dependency "rq"
dependency "jq"

# Libcharset is safe to rely on as it's part of OSX
whitelist_file /libarchive\..+/

# this gets pulled in as a bash dependency but
# we do not want it in the final lib
delete "#{install_dir}/embedded/lib/libiconv.*"