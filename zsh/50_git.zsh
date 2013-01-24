#!/bin/bash

# make hub an alias for git
eval "$(hub alias -s)"

# create shell aliases for most used git commands
alias st='git st'
alias ci='git ci'
alias lg='git log'
alias co='git co'
alias add='git add'
alias push='git push'
alias pull='git pull'
alias cached='git diff --cached'
alias staged='git diff --cached'
alias up='RBENV_VERSION=1.9.3-p362 git up'
