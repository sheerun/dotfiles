# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/libs/oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

DISABLE_AUTO_TITLE="false"

plugins=(bundler gem git git-flow lol nanoc nyan osx rails3 sprunge vim)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/Cellar/postgresql/9.2.1/bin:$PATH
export PATH=$PATH:/Users/sheerun/Library/play-2.0.2
export PATH="$HOME/.rbenv/bin:$PATH"

source ~/.zsh_profile

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export RUBYMINE_HOME="/Applications/RubyMine.app"

export GNUTERM=x11

eval "$(rbenv init - --no-rehash)"

cdpath=( . ~/Projects )

# for fast auto completion
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:functions' ignored-patterns '_*'


# for highlighted prefixes on autocompletion
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle ':completion:*' squeeze-slashes true

EDITOR=vim

launchctl setenv PATH $PATH
