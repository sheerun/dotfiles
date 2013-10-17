export PATH="$HOME/.bin:$PATH"
export GOPATH="$HOME/Source/go"

# Antigen is "package manager" for zsh
source ~/.modules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOB
  # git-extras
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
  zsh-users/zaw
EOB

antigen theme sheerun/oh-my-zsh-powerline-theme powerline
antigen apply

# eval "$(rbenv init - --no-rehash)"
fpath=(~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions.git/src $fpath)

bindkey '^R' zaw-history
bindkey '^O' zaw-git-files-legacy

autoload -U zmv

# Editor
export EDITOR="vim"

# Less
export LESSOPEN="| src-hilite-lesspipe.sh %s"
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

# Readline
export WORDCHARS='*?[]~&;!$%^<>'
unsetopt correct_all

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export LANG="en_US.UTF-8"

source ~/.zstyle
source ~/.zalias
source ~/.zfunction

source /opt/boxen/env.sh
