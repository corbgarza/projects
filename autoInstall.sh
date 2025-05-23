sudo apt install -y brightnessctl btop curl fastfetch feh ffmpeg fonts-noto-color-emoji fzf gettext git i3 imagemagick kitty lightdm mpv network-manager nm-tray openssh-client openssh-server picom pipx polybar psmisc pulseaudio python3 ripgrep rofi stow sxhkd tealdeer x11-xserver-utils xsel zoxide zsh
pipx install pywal16 spotdl yt-dlp

sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
zsh -c "brew install bat nvim yazi"

curl -fsS https://dl.brave.com/install.sh | sh
git clone https://github.com/corbgarza/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
git clone https://github.com/corbgarza/dotfiles.git $HOME/dotfiles 
git clone https://github.com/corbgarza/projects.git $HOME/projects
git clone https://github.com/corbgarza/Wallpaper.git $HOME/Wallpaper
if [[ ! -e ~/repos/powerlevel10k ]]; then git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/repos/powerlevel10k; echo "installing powerlevel10k"; fi
if [[ ! -e ~/repos/zsh-syntax-highlighting ]]; then git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/repos/zsh-syntax-highlighting; echo "installing syntax-highlighting"; fi 
if [[ ! -e ~/repos/zsh-autosuggestions ]]; then git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/repos/zsh-autosuggestions; echo "installing autosuggestions"; fi
if [[ ! -e ~/dotfiles ]]; then git clone https://github.com/corbgarza/dotfiles $HOME/dotfiles; echo "installing dotfiles"; fi

cd $HOME/dotfiles
stow gitconfig i3 kitty myscripts p10k picom polybar qutebrowser rofi sxhkd zsh
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/

chsh -s $(which zsh)
sudo update-alternatives --config editor
sudo update-alternatives --config x-terminal-emulator

cd $HOME/dotfiles
git remote set-url origin git@github.com:corbgarza/dotfiles.git
cd $HOME/projects
git remote set-url origin git@github.com:corbgarza/projects.git
cd $HOME/Wallpaper
git remote set-url origin git@github.com:corbgarza/Wallpaper.git

cd $HOME
mkdir -p $HOME/.ssh
ssh-keygen -f $HOME/.ssh/github

sudoedit /etc/default/grub
sudoedit /etc/lightdm/lightdm.conf
sudoedit /etc/lightdm/lightdm-gtk-greeter.conf
echo 'export PATH=$PATH:$HOME' > $HOME/.xsessionrc
