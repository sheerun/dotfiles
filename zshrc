if [[ ! -d ~/.modules ]]; then
  mkdir -p ~/.modules
fi

if [[ ! -f ~/.modules/antigen.zsh ]]; then
  curl -s https://cdn.rawgit.com/zsh-users/antigen/v2.2.1/bin/antigen.zsh > ~/.modules/antigen.zsh
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

# Readline
export WORDCHARS='*?[]~&;!$%^<>'
export LANG="en_US.UTF-8"

for i in ~/.zsh/*.sh; do source $i; done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="./bin:$PATH"

if command -v gpg-agent > /dev/null; then
  if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
  else
    eval $(gpg-agent --daemon ~/.gnupg/.gpg-agent-info)
  fi
fi

. ~/.env

lazy_load() {
    local -a names
    if [[ -n "$ZSH_VERSION" ]]; then
        names=("${(@s: :)${1}}")
    else
        names=($1)
    fi
    unalias "${names[@]}"
    . $2
    shift 2
    $*
}

group_lazy_load() {
    local script
    script=$1
    shift 1
    for cmd in "$@"; do
        alias $cmd="lazy_load \"$*\" $script $cmd"
    done
}

export NVM_DIR="$HOME/.nvm"
group_lazy_load $HOME/.nvm/nvm.sh nvm node npm yarn

export RSENSE_HOME=/Users/sheerun/.gem/ruby/2.3.3
group_lazy_load $HOME/.rubyrc ruby bundle rake rails

unset -f group_lazy_load
