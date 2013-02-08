# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681
# https://github.com/mxcl/homebrew/issues/10245
if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
  sudo xcode-select -switch /usr/bin
fi

# fix path loading of libexec tools.
# https://github.com/sorin-ionescu/prezto
ls -la /usr/libexec/path_helper | grep rwx || {
  sudo chmod ugo-x /usr/libexec/path_helper
}

if [[ -z $commands[brew] ]]; then
  e_header "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

if [[ -n $commands[brew] ]]; then
  e_header "Updating Homebrew..."
  brew update

  e_header "Upgrading Homebrew..."
  brew upgrade

  list="$(to_install "${homebrew_recipe}" "$(brew list)")"
  if [[ -n "$list" ]]; then
    e_header "Installing Homebrew recipes: $list"
    (brew list | grep ^$list$ > /dev/null) || brew install $list
  fi

  if [[ -z $commands[gcc-4.2] ]]; then
    e_header "Installing Homebrew dupe recipe: apple-gcc42"
    brew install https://raw.github.com/Homebrew/homebrew-dupes/master/apple-gcc42.rb
  fi
fi

cd $HOME/.rbenv/versions && ln -sf /usr/local/opt/ruby "1.9.3-stable"
