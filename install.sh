#!/usr/bin/env bash
set -x
curdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"
echo "$curdir" 

git config --global user.name "TQ"
git config --global user.email "tquinn86@github.com"
git config --global push.default simple


ln -s "$curdir/git/gitconfig.aliases.symlink" ~/gitconfig.aliases
git config --global include.path ~/gitconfig.aliases

if [[ "$(uname -s)" == "Darwin" ]]; then
  #use zsh on MacOS
  ln -s "$curdir/.zshrc" ~/.zshrc
  zsh
else
  # use bash. TODO, deal with WSL2
  ln -s "$curdir/.bash_profile" ~/.bash_profile
  bash
fi
