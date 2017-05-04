fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

work_log() {
  for i in *; do [ -d "$i/.git" ] && (cd $i; git log --all --date=short --pretty=format:"%ad $i %s" --author="$(git config --get user.email)") 2> /dev/null; done | sort | tac
}
