source "https://rubygems.org"

gem "omnibus", github: ENV.fetch("OMNIBUS_GITHUB_REPO", "chef/omnibus"), branch: ENV.fetch("OMNIBUS_GITHUB_BRANCH", "master")
gem "omnibus-software", github: ENV.fetch("OMNIBUS_SOFTWARE_GITHUB_REPO", "chef/omnibus-software"), branch: ENV.fetch("OMNIBUS_SOFTWARE_GITHUB_BRANCH", "master")
gem "artifactory"

gem "chefstyle"

group :rake do
  gem "rake"
  gem "tomlrb"
end
