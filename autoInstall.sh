#!/bin/bash
sudo apt install -y brightnessctl build-essential cmake curl feh ffmpeg fonts-noto-color-emoji fzf g++ gettext gpick i3 kitty network-manager ninja-build nm-tray openssh-client openssh-server openvpn pcmanfm picom pkg-config polybar psmisc pulseaudio python3 ripgrep rofi speedtest-cli stow tealdeer vlc x11-xserver-utils xsel zoxide zsh

if ! command -v brew > /dev/null; then sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash; fi
if ! command -v brave-browser > /dev/null; then curl -fsS https://dl.brave.com/install.sh | sh; fi

git clone https://github.com/corbgarza/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
git clone https://github.com/corbgarza/dotfiles $HOME/dotfiles && cd $HOME/dotfiles && stow gitconfig i3 p10k picom polybar rofi zsh

chsh -s $(which zsh) && source ~/.zshrc && zsh -c "brew install bat nvim yazi" 
sudo update-alternatives --config x-terminal-emulator
