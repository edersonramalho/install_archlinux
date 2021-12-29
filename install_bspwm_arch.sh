#!/bin/bash

func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## The package "$1" is already installed"
	      	echo "###############################################################################"
	      	echo
		tput sgr0
	else
	
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Installing package "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1
    fi
}

###############################################################################
echo "Installation of the core software"
###############################################################################

list_sys=(
sddm
picom
polybar
rofi
gvfs
thunar
thunar-archive-plugin
thunar-volman
feh
which
sudo
gparted
grub-customizer
clamav
clamtk
zsh
efibootmgr
gzip
p7zip
unzip
htop
gnome-disk-utility
libnotify
netctl
networkmanager
pavucontrol
pulseaudio
pulseaudio-alsa
scrot
wget
wireless_tools
)

list_font=(
nerd-fonts-roboto-mono
tf-font-awesome
ttf-inconsolata
ttf-roboto
nordic-theme-git
numix-icon-theme-git
otf-font-awesome
)

list_dev=(
git
meld
visual code
git
zeal
gitahead
lazygit
neoVim
python-pip
)

list=(
brave
libreoffice
spotify
vlc
)

lista_erro=(
yay-git
brave
nevim
zeal
gitahead
nordic theme
numinx theme
nerd fonts
anwesome fonts ttf
networkmanager-dmenu-bluetoothfix-git
spotfy
yay-git)
## + Bootstrap dbeaver?
## + configuração
## vmware-workstation
## 
count=0

for name in "${list_sys[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

count=0

for name in "${list_font[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

count=0

for name in "${list_dev[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

tput setaf 5;echo "################################################################"
echo "Enabling sddm as display manager"
echo "################################################################"
echo;tput sgr0
sudo systemctl enable sddm.service -f

tput setaf 7;echo "################################################################"
echo "You now have a very minimal functional desktop"
echo "################################################################"
echo;tput sgr0

tput setaf 11;
echo "################################################################"
echo "Reboot your system"
echo "################################################################"
echo;tput sgr0
