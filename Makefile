.PHONY: build install

build:
	bin/setup

install: build
	@ln -sfv "${PWD}/zshrc" "${HOME}/.zshrc"
	@echo "Please restart zsh..."

clean:
	rm -rf modules
