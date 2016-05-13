export HOMEBREW_CASK_OPTS="--appdir=/Applications"

MODULES=(
  "tpm:tmux-plugins/tpm"
  "antigen:zsh-users/antigen"
)

for module in $MODULES; do
  ddir="$HOME/.modules/$(printf "$module" | cut -d ':' -f 1)"
  ppath="$(printf "$module" | cut -d ':' -f 2)"
  
  if [[ ! -d $ddir ]]; then
    (mkdir -p "$ddir" &&
      git clone --depth 1 https://github.com/$ppath.git "$ddir" && printf '.')
  fi
done

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

if [[ -f ~/.nix-profile/etc/profile.d/nix.sh ]]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

source ~/.zstyle
source ~/.zalias
source ~/.zfunction

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="./bin:$PATH"

if command -v gpg-agent > /dev/null; then
  if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
  else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
  fi
fi
