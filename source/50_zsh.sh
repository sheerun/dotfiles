# make prezto a base for zsh configuration
source ~/.zprezto/init.zsh

# set locale variables to en_US and UTF-8
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="C"

# ensure /usr/local/bin has the highest precedence
export PATH=/usr/local/bin:$PATH
export PATH="$(brew --prefix coreutils)/libexec/gnubin":$PATH

# disable autocorrection as it's extremely annoying
unsetopt correct_all

# make rbenv init faster by disabling auto rehash
eval "$(rbenv init - --no-rehash)"

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi
