# Set `open` tool as default `BROWSER` on OS X.
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Ensure locale settings are properly set-up.
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Keep only the first occurence in path, cdpath etc.
typeset -gU cdpath fpath mailpath path

export GOPATH="$HOME/Source/go"

# Set the list of directories that Zsh searches for programs.
path=(
  ./bin
  /node_modules/.bin
  $HOME/.cabal/bin
  /usr/local/heroku/bin
  $HOME/.rbenv/shims
  $HOME/.rbenv/bin
  $HOME/.bin
  $GOPATH/bin
  /usr/local/opt/llvm/bin
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/share/npm/bin
  $(brew --prefix homebrew/php/php56)/bin
  /usr/local/{bin,sbin}
  $path
)

export LESS='-R -F -X -n'
