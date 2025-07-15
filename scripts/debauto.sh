#!/usr/bin/env bash

sudo apt install -y nala git >/dev/null && echo "****Installed nala and git!****"
git clone https://github.com/corbgarza/dotfiles.git $HOME/dotfiles >/dev/null && echo "****Cloned dotfiles!****"
#curl -fsS https://dl.brave.com/install.sh | sh > /dev/null && echo "****Installed Brave!****"
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash >/dev/null && echo "****Installed Brew!****"

total=$(wc -l <$HOME/projects/scripts/debauto.progs)
while IFS=, read -r installer package; do	
  gitpath=$HOME/.config/$(echo $package | awk -F "." '{print $(NF-1)}')
  n=$((n + 1))
	case "$installer" in
	"a") sudo nala install -y $package > /dev/null && echo "****Installed $package, #$n of $total!****" ;;
	"b") /home/linuxbrew/.linuxbrew/bin/brew install $package > /dev/null && echo "****Installed $package, #$n of $total!****";;
	"p") pipx install $package > /dev/null && echo "****Installed $package, #$n of $total!****" ;;
	"g") git clone --depth=1 https://github.com/$package $gitpath > /dev/null && echo "****Installed $package, #$n of $total!****" ;;
	esac
done <$HOME/projects/scripts/debauto.progs

cd $HOME/dotfiles && git remote set-url origin git@github.com:corbgarza/dotfiles.git >/dev/null && echo "****Set dotfiles url!****"
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/ && echo "****Copied Fonts!****"
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub && sudo update-grub > /dev/null && echo "****Updated Grub!****"
#sudo echo "export EDITOR=$(which nvim)" >> /root/.profile && echo "root EDITOR is set to nvim!"
chsh -s $(which fish) && echo "****Changed default shell to fish!****"
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"; echo 'Installed Fisher!'

mkdir -p $HOME/.config
stow -v -t $HOME/.config -d $HOME/dotfiles fish gitconfig i3 kitty nvim picom polybar qutebrowser rofi sxhkd yt-dlp
echo "****Done! Reboot to complete!****"
