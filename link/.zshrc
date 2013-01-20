# Add binaries into the path
export PATH=~/.dotfiles/bin:$PATH

function src() {
  for file in ~/.zsh.d/*; do
    source "$file"
  done
}

# Run dotfiles script, then source.
function dotfiles() {
  ~/.dotfiles/bin/dotfiles "$@" && src
}

src
