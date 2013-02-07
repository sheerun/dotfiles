# Ubuntu-only stuff. Abort if not Ubuntu.
[[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1

cat /etc/passwd | grep $USER | grep zsh >& /dev/null
if [ $? -eq 0 ]; then
  sudo chsh -s $(which zsh) $USER
fi
