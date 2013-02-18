# Set `open` tool as default `BROWSER` on OS X.
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Ensure locale settings are properly set-up.
eval "$(locale)"

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)
