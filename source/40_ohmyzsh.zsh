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

EDITOR=vim

launchctl setenv PATH $PATH
