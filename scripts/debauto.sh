#!/usr/bin/env bash

sudo apt install -y curl git nala pipx stow >/dev/null
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash >/dev/null
git clone https://github.com/corbgarza/projects.git $HOME/projects >/dev/null
git clone https://github.com/corbgarza/dotfiles.git $HOME/dotfiles >/dev/null
git clone https://github.com/corbgarza/Wallpaper.git $HOME/Wallpaper >/dev/null

mkdir -p $HOME/.config
cd $HOME/dotfiles
stow fish gitconfig i3 kitty nvim picom polybar qutebrowser rofi sxhkd yt-dlp
cd $HOME

apt_array=("brightnessctl" "btop" "curl" "feh" "ffmpeg" "fish" "fonts-noto-color-emoji" "fzf" "git" "i3" "imagemagick" "kitty" "mpv" "network-manager" "openssh-client" "openssh-server" "picom" "pipx" "polybar" "psmisc" "pulseaudio" "python3" "qutebrowser" "ripgrep" "rofi" "stow" "sxhkd" "tealdeer" "tree" "virt-manager" "vlc" "x11-xserver-utils" "xinit" "xsel" "zoxide")
brew_array=("bat" "eza""fd" "gcc" "nvim")
pip_array=("spotdl" "pywal16" "yt-dlp")

sudo nala install -y ${apt_array[@]} >/dev/null
/home/linuxbrew/.linuxbrew/bin/brew install ${brew_array[@]} >/dev/null
#pipx install ${pip_array[@]} >/dev/null

fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
curl -fsS https://dl.brave.com/install.sh | sh >/dev/null

cd $HOME/dotfiles && git remote set-url origin git@github.com:corbgarza/dotfiles.git >/dev/null
cd $HOME/projects && git remote set-url origin git@github.com:corbgarza/projects.git >/dev/null
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/
