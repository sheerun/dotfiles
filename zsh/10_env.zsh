# ensure /usr/local/bin has the highest precedence
export PATH=$HOME/.bin:/usr/local/bin:$HOME/.python/bin/:$PATH
export PATH=$PATH:$HOME/.dotfiles/libs/git-submodule-tools
export PATH=$PATH:$HOME/.dotfiles/lib/git-extras/bin
export PATH=$HOME/.cabal/bin:$PATH

if [[ "$OSTYPE" =~ ^darwin ]]; then
    export PATH=$(brew --prefix postgresql)/bin:$PATH
    export PATH="$(brew --prefix coreutils)/libexec/gnubin":$PATH
fi
# Editing

export EDITOR="vim"
export LESSOPEN="| src-hilite-lesspipe.sh %s"
