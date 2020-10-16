git config --global user.name "TQ"
git config --global user.email "tquinn86@github.com"
git config --global push.default simple

# use bash
ln -s ~/.dotfiles/.bash_profile ~/
ln -s ~/.dotfiles/git/gitconfig.aliases.symlink ~/github.aliases
git config --global include.path ~/.gitconfig.aliases
bash

