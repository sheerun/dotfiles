source ~/.zsh/sheerun-home/home.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Brew command extensions
function brew() {
	(
		set -eo pipefail

		if [ "$1 $2" = "bundle " ] && ! [ -f Brewfile ]; then
			clear
			vim ~/.config/Brewfile && brew bundle --file ~/.config/Brewfile --cleanup
			[ $? -eq 0 ] || return $?
			brew cu --no-quarantine --yes --cleanup --all --no-brew-update
			return $?
		fi

		command brew "$@"
	)
}

# Vim command extensions
function vim() {
	command vim "$@"

	if [ "$1" = "$HOME/.zshrc" ]; then
		source ~/.zshrc
	fi
}

export GPG_TTY=$(tty)

download-youtube-channel() {
	youtube-dl --format 'bestvideo[height<=720]+bestaudio/best[height<=720]' --min-views 50000 --output '%(title)s-%(id)s.%(ext)s' $1
}

export PUBLIC=$HOME/Public

alias docker="lima nerdctl"
