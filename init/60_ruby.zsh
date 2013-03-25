# Install ruby if not installed
if [[ ! -d ~/.rbenv/versions/2.0.0 ]]; then
  ruby-build 2.0.0-rc1 ~/.rbenv/versions/2.0.0
fi

# Make ruby 2.0.0 the default installation.
rbenv global 2.0.0

# Install most important ruby gems.
if [[ -z $commands[gem] ]]; then
  gems=(bundler awesome_print git-up)

  list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
  if [[ -n "$list" ]]; then
    e_header "Installing Ruby gems: $list"
    gem install $list
  fi
fi
