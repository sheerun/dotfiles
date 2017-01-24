if [[ ! -d ~/.modules ]]; then
  mkdir -p ~/.modules
fi

if [[ ! -f ~/.modules/antigen.zsh ]]; then
  curl -s https://cdn.rawgit.com/zsh-users/antigen/v1.3.4/bin/antigen.zsh > ~/.modules/antigen.zsh
fi

if [[ ! -d ~/.modules/tpm ]]; then
  git clone  https://github.com/tmux-plugins/tpm.git -b v3.0.0 --depth 1 ~/.modules/tpm 2> /dev/null
fi

source ~/.modules/antigen.zsh

antigen use oh-my-zsh
antigen bundle safe-paste
antigen bundle extract
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

RPROMPT="%f%k%(?.. %F{red}✘ %?) %f%k"
PROMPT="$FG[000]$BG[148] ⌂ $FG[249]$BG[236] %1~ %k%f "

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Less
export LESSSECURE=1

fpath=(~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions.git/src $fpath)

# Readline
export WORDCHARS='*?[]~&;!$%^<>'
export LANG="en_US.UTF-8"

export NVM_DIR="$HOME/.nvm"

for i in ~/.zsh/*.sh; do source $i; done

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

. ~/.env
