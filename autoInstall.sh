#!/bin/bash
read -p "Install My PKGs (y/n)? " FILES
if [ $FILES = "n" ] || [ $FILES = "N" ]; then
	echo "SKIPPING"
else
	sudo apt install -y brightnessctl build-essential cmake curl g++ gettext git gpick i3 lightdm network-manager ninja-build nm-tray openssh-client openssh-server pcmanfm picom pkg-config polybar psmisc python3 samba smbclient stow x11-xserver-utils xsel zsh
fi

read -p "Install Homebrew and Brave (y/n)? " BREWBRAVE
if [ $BREWBRAVE = "n" ] || [ $BREWBRAVE = "N" ]; then
	echo "SKIPPING"
else
	if ! command -v brew > /dev/null; then sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash; 
	fi
	if ! command -v brave-browser > /dev/null; then curl -fsS https://dl.brave.com/install.sh | sh; 
	fi
fi

read -p "Install Homebrew PKGs (y/n)? " BREWPKGS
if [ $BREWPKGS = "n" ] || [ $BREWPKGS = "N" ]; then
	echo "SKIPPING"
else
	zsh -c "brew install bat btop feh ffmpeg fzf gedit imagemagick nvim pulseaudio ripgrep rofi tealdeer yazi"
	zsh -c "brew install --cask alacritty font-noto-color-emoji kitty vlc zoxide" 
fi

read -p "Setup NVIM, dotfiles, fonts, and ZSH (y/n)? " SETUP
if [ $SETUP = "n" ] || [ $SETUP = "N" ]; then
	echo "SKIPPING"
else
	git clone https://github.com/corbgarza/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
	git clone https://github.com/corbgarza/dotfiles $HOME/dotfiles && cd $HOME/dotfiles && stow gitconfig i3 p10k picom polybar rofi zsh
	sudo cp ~/dotfiles/fonts/* /usr/local/share/fonts/
	chsh -s $(which zsh) 
	source ~/.zshrc 
	sudo update-alternatives --config x-terminal-emulator
fi

