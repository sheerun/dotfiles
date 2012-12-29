# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/libs/oh-my-zsh

ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"

DISABLE_AUTO_TITLE="false"

plugins=(bundler gem git git-flow lol nanoc nyan osx rails3 sprunge vim)
source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export RUBYMINE_HOME="/Applications/RubyMine.app"

cdpath=( . ~/Projects )

