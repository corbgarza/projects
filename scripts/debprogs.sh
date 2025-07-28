#!/usr/bin/env bash

sudo apt install -y nala git >/dev/null
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash >/dev/null
curl -fsS https://dl.brave.com/install.sh | sh > /dev/null
while IFS=, read -r installer package; do	
	case "$installer" in
	"a") sudo nala install -y $package > /dev/null
	"b") /home/linuxbrew/.linuxbrew/bin/brew install $package > /dev/null
	"p") pipx install $package > /dev/null
	"g") git clone https://github.com/$package > /dev/null
	esac
done <$HOME/projects/scripts/debauto.progs
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
