# Antigen is "package manager" for zsh
source ~/.dotfiles/lib/antigen/antigen.zsh

antigen-bundle ~/.zsh

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
