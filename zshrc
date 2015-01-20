export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Antigen is "package manager" for zsh
source ~/.modules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOB
  safe-paste
  extract
  zsh-users/zsh-syntax-highlighting
  zsh-users/zaw
  zsh-users/zsh-completions
EOB

antigen theme sheerun/oh-my-zsh-powerline-theme powerline

antigen apply

# Refresh completions
# rm -f ~/.zcompdump; compinit

# Editor
export EDITOR="vim"

# Less
export LESSOPEN="| src-hilite-lesspipe.sh %s"

fpath=(~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions.git/src $fpath)

bindkey '^R' zaw-history
bindkey '^O' zaw-git-files-legacy

autoload -U zmv

# Readline
export WORDCHARS='*?[]~&;!$%^<>'

export LANG="en_US.UTF-8"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/sheerun/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

source /Users/sheerun/.nix-profile/etc/profile.d/nix.sh


source ~/.zstyle
source ~/.zalias
source ~/.zfunction
