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

# Set the list of directories that Zsh searches for programs.
path=( /usr/local/{bin,sbin} $path )

export LESS='-R -F -X -n'
