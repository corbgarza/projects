#!/bin/bash
read -p "Install PKGS? " PKGS
read -p "Install Homebrew? " BREW
read -p "Install Homebrew PKGS? " BREWPKGS
read -p "Install Brave? " BRAVE
read -p "Install Python PKGS? " PIPX
read -p "Install Kitty? " KITTY
read -p "Install Fonts? " FONTS
read -p "Setup NVIM? " NVIM
read -p "Setup dotfiles? " DOTFILES
read -p "Setup ZSH? " ZSH

if [ $PKGS = "n" ] || [ $PKGS = "N" ]; then
	echo "\n\n****No PKGS installing!"
else
	sudo apt install -y alacritty brightnessctl build-essential cmake curl fonts-noto-color-emoji g++ gettext git gpick i3 lightdm mpv network-manager ninja-build nm-tray openssh-client openssh-server pcmanfm picom pipx pkg-config polybar psmisc python3 samba smbclient stow vlc x11-xserver-utils xsel zoxide zsh
fi

if [ $BREW = "n" ] || [ $BREW = "N" ]; then
	echo "\n\n****Homebrew not installing!"
else
	if ! command -v brew > /dev/null; then sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash; fi
fi

if [ $BRAVE = "n" ] || [ $BRAVE = "N" ]; then
	echo "\n\n****Brave not installing!"
else
	if ! command -v brave-browser > /dev/null; then curl -fsS https://dl.brave.com/install.sh | sh; fi
fi

if [ $KITTY = "n" ] || [ $KITTY = "N" ]; then
	echo "\n\n****Kitty not installing!"
else
	if ! command -v kitty > /dev/null; then curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin; fi
fi

if [ $PIPX = "n" ] || [ $PIPX = "N" ]; then
	echo "\n\n****No Python PKGS installing!"
else
	pipx install pywal16
	pipx install yt-dlp
	pipx install spotdl
fi

