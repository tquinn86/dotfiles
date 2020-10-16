git config --global user.name "TQ"
git config --global user.email "tquinn86@github.com"
git config --global push.default simple
git config --global alias.cob "!f() { git checkout -b $USER/$1; }; f;"

# use bash
ln -s ~/.dotfiles/.bash_profile ~/
bash

