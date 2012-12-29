#!/bin/bash
# Concatenate gitignore files

cat ~/.dotfiles/libs/gitignore/Global/*.gitignore > ~/.gitignore_global
cat ~/.dotfiles/conf/.gitignore_global >> ~/.gitignore_global
