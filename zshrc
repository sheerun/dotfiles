export HOMEBREW_CASK_OPTS="--appdir=/Applications"

MODULES=(
  "tpm:tmux-plugins/tpm"
  "antigen:sheerun/antigen"
  "rbenv:sstephenson/rbenv"
  "rbenv/plugins/rbenv-binstubs:ianheggie/rbenv-binstubs"
  "rbenv/plugins/rbenv-ctags:tpope/rbenv-ctags"
  "rbenv/plugins/rbenv-default-gems:sstephenson/rbenv-default-gems"
  "rbenv/plugins/ruby-build:sstephenson/ruby-build"
  "rbenv/plugins/rvm-download:garnieretienne/rvm-download"
)

for module in $MODULES; do
  ddir="$HOME/.modules/$(printf "$module" | cut -d ':' -f 1)"
  ppath="$(printf "$module" | cut -d ':' -f 2)"
  
  if [[ ! -d $ddir ]]; then
    (mkdir -p "$ddir" &&
      git clone --depth 1 https://github.com/$ppath.git "$ddir" && printf '.')
  fi
done

echo bundler >> ~/.modules/rbenv/default-gems

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

export PATH="./bin:$PATH"

eval "$(rbenv init -)"
