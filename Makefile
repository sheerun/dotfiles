.PHONY: build install

build: modules/rbenv

install: build
	@bin/dotfiles .

modules/rbenv:
	git clone https://github.com/sstephenson/rbenv.git modules/rbenv
