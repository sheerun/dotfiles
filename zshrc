export PATH="$HOME/.bin:$PATH"

source ~/.zstyle
source ~/.zalias
source ~/.zfunction

# Antigen is "package manager" for zsh
export ANTIGEN_DEFAULT_REPO_URL=https://github.com/sheerun/oh-my-zsh.git
source ~/.dotfiles/modules/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOB
  rbenv
  git-extras
  zsh-users/zsh-syntax-highlighting
  zsh-users/zaw
  zsh-users/zsh-history-substring-search
EOB
antigen theme sheerun/oh-my-zsh-powerline-theme powerline
antigen apply

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
