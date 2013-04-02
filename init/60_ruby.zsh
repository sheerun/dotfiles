if [[ -z $commands[gem] ]]; then
  gems=(bundler awesome_print git-up)

  list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
  if [[ -n "$list" ]]; then
    e_header "Installing Ruby gems: $list"
    gem install $list
  fi
fi
