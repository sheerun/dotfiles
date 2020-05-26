# if [[ ! -d ~/.modules/tpm ]]; then
#   git clone  https://github.com/tmux-plugins/tpm.git -b v3.0.0 --depth 1 ~/.modules/tpm 2> /dev/null
# fi

source ~/.bin/antigen

antigen bundle sheerun/home
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

[ -f ~/.env ] && source ~/.env
