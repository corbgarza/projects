#!/usr/bin/env bash

sudo apt install -y nala git >/dev/null
git clone https://github.com/corbgarza/projects.git $HOME/projects >/dev/null
git clone https://github.com/corbgarza/dotfiles.git $HOME/dotfiles >/dev/null
git clone https://github.com/corbgarza/Wallpaper.git $HOME/Wallpaper >/dev/null
cd $HOME/dotfiles && git remote set-url origin git@github.com:corbgarza/dotfiles.git >/dev/null
cd $HOME/projects && git remote set-url origin git@github.com:corbgarza/projects.git >/dev/null
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/
mkdir -p $HOME/.config
