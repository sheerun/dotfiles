# install ruby-build
mkdir -p $HOME/.dotfiles/libs/rbenv/plugins
cd $HOME/.dotfiles/libs/rbenv/plugins

if [[ ! -h ./ruby-build ]]; then
  ln -s ../../ruby-build;
fi

# install ruby
if [[ "$(type -P rbenv)" ]]; then
  versions=(1.9.3-p362 1.8.7-p371)

  list="$(to_install "${versions[*]}" "$(rbenv whence ruby)")"
  if [[ "$list" ]]; then
    e_header "Installing Ruby versions: $list"
    for version in $list; do rbenv install "$version"; done
    [[ "$(echo "$list" | grep -w "${versions[0]}")" ]] && rbenv global "${versions[0]}"
    rbenv rehash
  fi
fi

# install gems
if [[ "$(type -P gem)" ]]; then
  gems=(bundler awesome_print git-up ruby-debug-ide)

  list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
  if [[ "$list" ]]; then
    e_header "Installing Ruby gems: $list"
    gem install $list
  fi
fi
