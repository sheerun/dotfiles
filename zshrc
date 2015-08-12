export HOMEBREW_CASK_OPTS="--appdir=/Applications"

if [[ ! -d $HOME/.modules/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.modules/tpm
fi

# Antigen is "package manager" for zsh
if [[ ! -d $HOME/.modules/antigen ]]; then
  git clone https://github.com/sheerun/antigen.git ~/.modules/antigen
fi
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
if command -v nvim > /dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi


# Less
export LESSSECURE=1

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

if [[ -f ~/.nix-profile/etc/profile.d/nix.sh ]]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source ~/.zstyle
source ~/.zalias
source ~/.zfunction

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
