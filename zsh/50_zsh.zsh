source ~/.dotfiles/lib/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen-lib
antigen-bundle git
antigen-bundle rbenv
antigen-bundle sprunge
antigen-bundle bundler
antigen-bundle git-extras
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zaw
antigen-bundle zsh-users/zsh-history-substring-search
antigen-theme robbyrussell
antigen-apply

# disable autocorrection as it's extremely annoying
unsetopt correct_all

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi
