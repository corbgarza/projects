#!/bin/bash
read -p "Install My Files?: " files
if [ $files = "n" ] || [ $files = "N" ]; then
	echo "SKIPPING"
else
	sudo apt install -y brightnessctl btop build-essential cmake curl feh ffmpeg fonts-noto-color-emoji fzf g++ gettext gpick i3 kitty network-manager ninja-build nm-tray openssh-client openssh-server openvpn pcmanfm picom pkg-config polybar psmisc pulseaudio python3 ripgrep rofi samba smbclient speedtest-cli stow tealdeer vlc x11-xserver-utils xsel zoxide zsh
fi

read -p "Install Homebrew and Brave?: " brewbrave
if [ $brewbrave = "n" ] || [ $brewbrave = "N" ]; then
	echo "SKIPPING"
else
	if ! command -v brew > /dev/null; then sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash; 
	zsh -c "brew install bat nvim yazi" 
	fi
	if ! command -v brave-browser > /dev/null; then curl -fsS https://dl.brave.com/install.sh | sh; 
	fi
fi

read -p "Setup NVIM and dotfiles? " setup
if [ $setup = "n" ] || [ $setup = "N" ]; then
	echo "SKIPPING"
else
	git clone https://github.com/corbgarza/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
	git clone https://github.com/corbgarza/dotfiles $HOME/dotfiles && cd $HOME/dotfiles && stow gitconfig i3 p10k picom polybar rofi zsh
	sudo cp ~/dotfiles/fonts/* /usr/local/share/fonts/
	chsh -s $(which zsh) && source ~/.zshrc 
	sudo update-alternatives --config x-terminal-emulator
fi
