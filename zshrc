if [[ ! -d ~/.modules ]]; then
  mkdir -p ~/.modules
fi

if [[ ! -f ~/.modules/antigen.zsh ]]; then
  curl -s https://cdn.rawgit.com/zsh-users/antigen/v2.2.3/bin/antigen.zsh > ~/.modules/antigen.zsh
fi

if [[ ! -d ~/.modules/tpm ]]; then
  git clone  https://github.com/tmux-plugins/tpm.git -b v3.0.0 --depth 1 ~/.modules/tpm 2> /dev/null
fi

source ~/.modules/antigen.zsh

antigen bundle safe-paste
antigen bundle extract
antigen bundle colored-man-pages
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen apply

typeset -AHg FX FG BG
for color in 000 148 249 236; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done
RPROMPT="%f%k%(?.. %F{red}✘ %?) %f%k"
PROMPT="$FG[000]$BG[148] ⌂ $FG[249]$BG[236] %1~ %k%f "

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Readline
export WORDCHARS='*?[]~&;!$%^<>'
export LANG="en_US.UTF-8"

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

# make autocompletion faster by caching and prefix-only matching
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# get better autocompletion accuracy by typing longer words
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# ignore completion functions for commands you don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# allow one error for every three characters typed
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle ':completion:*' squeeze-slashes true

# completing process IDs with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':filter-select:highlight' matched fg=red
zstyle ':filter-select' max-lines 10
zstyle ':filter-select' rotate-list yes
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search


fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SAVEHIST=100000
export HISTSIZE=100000
export HISTFILE=~/.zsh_history
setopt inc_append_history share_history
export PATH="/usr/local/opt/ruby/bin:$PATH"

[ -f ~/.env ] && source ~/.env

