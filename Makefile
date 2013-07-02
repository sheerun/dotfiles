.PHONY: build install

build: Modules/rbenv

install: build
	@bin/dotfiles .

Modules/rbenv:
	git clone https://github.com/sstephenson/rbenv.git Modules/rbenv
