# Set `open` tool as default `BROWSER` on OS X.
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Ensure locale settings are properly set-up.
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi


# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)
