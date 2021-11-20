source ~/.zsh/sheerun-home/home.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

function brew() {
	if [ "$1 $2" = "bundle " ] && ! [ -f Brewfile ]; then
		vim ~/.config/Brewfile && brew bundle --file ~/.config/Brewfile
		return $?
	fi

	command brew "$@"
}


export GPG_TTY=$(tty)
