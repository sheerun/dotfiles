#!/usr/bin/env zsh

# create shell aliases for most used git commands
alias st='git st'
alias ci='git ci'
alias lg='git log'
alias co='git co'
alias br='git br'
alias dc='git diff --cached'

alias add='git add --all'
alias log='git log'
alias push='git push'
alias pull='git pull'
alias stash='git stash'
alias clone='git clone'
alias fetch='git fetch'
alias merge='git merge -s recursive -X patience'
alias branch='git branch'
alias rebase='git rebase'
alias amend='git commit -C HEAD --amend'

alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# Pass aliases to root account
alias sudo='sudo '

if command -v gh > /dev/null; then
  eval "$(gh alias -s)"
fi

if command -v gls > /dev/null; then
   alias ls='gls --color=tty --group-directories-first'
fi

alias k='kubectl'
alias ks='kubectl -n kube-system'
