# Make 1.9.3 default ruby installation.
rbenv global 2.0

# Install ruby-build
mkdir ~/.rbenv/plugins && cd ~/.rbenv/plugins && ln -sf ~/.dotfiles/lib/ruby-build

# Install most important ruby gems.
if [[ -z $commands[gem] ]]; then
  gems=(bundler awesome_print git-up)

  list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
  if [[ -n "$list" ]]; then
    e_header "Installing Ruby gems: $list"
    gem install $list
  fi
fi
