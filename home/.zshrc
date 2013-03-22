# Antigen is "package manager" for zsh
export ANTIGEN_DEFAULT_REPO_URL=https://github.com/sheerun/oh-my-zsh.git
source ~/.dotfiles/lib/antigen/antigen.zsh

antigen lib

antigen bundles <<EOB
  rbenv
  bundler
  git-extras
  zsh-users/zsh-syntax-highlighting
  zsh-users/zaw
  zsh-users/zsh-history-substring-search
  ~/.zsh --no-local-clone
EOB

antigen theme sheerun/oh-my-zsh-powerline-theme powerline

antigen apply
