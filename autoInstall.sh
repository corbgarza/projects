sudo apt install -y alacritty brightnessctl curl fonts-noto-color-emoji git i3 kitty lightdm network-manager nm-tray openssh-client openssh-server pcmanfm picom pipx polybar psmisc python3 samba smbclient stow x11-xserver-utils zsh

sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

zsh -c "brew install bat btop feh ffmpeg fzf gedit gettext imagemagick mpv nvim pulseaudio ripgrep rofi tealdeer xsel yazi zoxide"

curl -fsS https://dl.brave.com/install.sh | sh

pipx install pywal16 spotdl yt-dlp

git clone https://github.com/corbgarza/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

git clone https://github.com/corbgarza/dotfiles $HOME/dotfiles 
git clone https://github.com/corbgarza/projects.git
git clone https://github.com/corbgarza/Wallpaper.git
cd $HOME/dotfiles
stow gitconfig i3 kitty p10k picom polybar qutebrowser rofi zsh
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/

chsh -s $(which zsh)
echo -e "update editor and x-terminal-emulator"
echo -e "set github remotes"
echo -e "setup github ssh keys"
