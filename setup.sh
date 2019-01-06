#!/bin/bash

sudo apt update


sudo apt install -y $(cat apt.packages | sed "s/\n/ /g" )

sudo apt remove -y tmux


# create required directories
directories=("$HOME/.local/bin")


for dir in $directories;
do mkdir -p $dir
done;


### Install zplug ###

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh



### END zplug ###


### Run custom Scripts
for i in `ls ./scripts/`; do
  echo "===========EXECUTING $i==========="
  ./scripts/$i
  echo "===========DONE WITH $i==========="
done

### Copy Dotfiles
backup=('.zshrc') #relative to ~/
for back in $backup; do
  mv ~/$back ~/$back.old
done

cp -a ./dotfiles/. ~/


### Install JANUS VIM
curl -L https://bit.ly/janus-bootstrap | bash

# source and run zplug
#source ~/.zplugrc

#zplug install
#zplug load --verbose
