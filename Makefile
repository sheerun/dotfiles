.PHONY: build install

build:
	bin/setup

install: build
	@bin/dotfiles .

clean:
	rm -rf modules
