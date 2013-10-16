```
gnutls
postgresql
geoip
mysql
vim
ack
ctags
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
aspell
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
htop
initdb /usr/local/var/postgres -E utf8
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
gem install powify
powify server install
brew install elasticsearch
ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist
```

# The list of paths used by cd command.

```
cdpath=( ~/Projects )
```

# Recipes to install on OS X by homebrew.

```
homebrew_recipes=(
  coreutils findutils ruby
  git git-extras git-flow zsh htop-osx tree lesspipe wget
  vim ssh-copy-id ctags mobile-shell ack
  source-highlight
)
```

xquartz

brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
brew install https://raw.github.com/derekprior/tmux-vim-select-pane/master/tmux-vim-select-pane.rb
CONFIGURE_OPTS="--without-tcl --without-tk" CC=/usr/local/bin/gcc-4.7 rbenv install 1.8.7-p374


brew cask alfred link

brew cask install bettertouchtool caffeine dropbox f-lux firefox google-chrome harvest heroku-toolbelt hip-chat iterm2 libre-office pgadmin3 qqbrowser sequel-pro steam transmission virtualbox

brew install ack aspell autoconf autoconf213 automake bazaar boost brew-cask cloog cmake coreutils cscope ctags datomic elasticsearch findutils freetype fswatch gcc47 gcc48 gdb gdbm gettext gfortran git git-extras git-flow glew glib gmp gnutls go graphicsmagick graphviz htop-osx imagemagick isl jpeg libevent libffi libmpc libpng libtasn1 libtiff libtool macvim memcached mercurial mobile-shell mongodb mpfr mysql nettle node openssl ossp-uuid p11-kit pcre pixman pkg-config postgresql protobuf pv python qemu qt r readline reattach-to-user-namespace redis scons sic source-highlight sqlite ssh-copy-id the_silver_searcher tmux tomcat tree unrar v8 wget xz yasm zsh
