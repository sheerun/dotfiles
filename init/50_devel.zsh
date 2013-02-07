# install ruby-build
mkdir -p $HOME/.dotfiles/lib/rbenv/plugins
cd $HOME/.dotfiles/lib/rbenv/plugins

[[ -h ./ruby-build ]] || ln -s ../../ruby-build

# install gems
if [[ "$(type -P gem)" ]]; then
  gems=(bundler awesome_print git-up)

  list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
  if [[ "$list" ]]; then
    e_header "Installing Ruby gems: $list"
    gem install $list
  fi
fi
