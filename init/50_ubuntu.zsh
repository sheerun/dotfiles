# Ubuntu-only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 0

cat /etc/passwd | grep $USER | grep zsh >& /dev/null || {
  echo "Changing your shell to zsh..."
  sudo chsh -s $(which zsh)
}
