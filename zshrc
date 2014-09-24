export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="./bin:./node_modules/.bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

export GOPATH="$HOME/Source/go"
export PATH="$GOPATH/bin:$PATH"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Antigen is "package manager" for zsh
source ~/.modules/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOB
  rbenv
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

source ~/.zstyle
source ~/.zalias
source ~/.zfunction
