#!/usr/bin/env bash
# 
# ---------------------------------------------------------------- #
# Script Name:   install_bspwm_arch.sh 
# Description:   Pós instalação do Arch Linux GUI (BSPWM).
# Site:          
# Linkedin:      
# Written by:    Ederson Santos
# Maintenance:   Ederson Santos
# ---------------------------------------------------------------- #
# Usage:         
#       $ ./install_bspwm_arch.sh
# ---------------------------------------------------------------- #
# History:       v1.0 31/12/2021, essantos:
#                - Inicio
#                - Definição dos programas
#                v1.1 , essantos:
#                - 
# -----------------------------------------------------------------#
# Thankfulness:
#
# -----------------------------------------------------------------#

#def

_BLACK=$(tput setaf 0)
_RED=$(tput setaf 1)
_GREEN=$(tput setaf 2)
_BLUE=$(tput setaf 4)
_BRANCO=$(tput setaf 7)
_RESET=$(tput sgr0)
_BOLD=$(tput bold)
_BR=$(tput setab 7)

#limpar tela

clear

#Titulo

echo "${_BOLD}${_BLACK}${_BR}"
echo "                                                                 "
echo "----------------[Pos Instalação Arch Linux (Gui)]----------------"
echo "                                                                 "
echo "${_RESET}" 

# Variáveis ---  

list_sys=(	
	xorg
	xorg-server
	gnome
	gnome-extra
	gnome-tweak-tool
	patch
	lightdm
	lightdm-webkit2-greeter
	picom
	automake
	polybar
	rofi
	gvfs
	nemo
	feh
	which
	sudo
	gparted
	grub-customizer
	print-manager
	clamav
	clamtk
	usbutils
	firefox
	zsh
	zsh-syntax-highlighting
	zsh-autosuggestions
	efibootmgr
	gzip
	p7zip
	unrar
	unzip
	traceroute
	ark
	htop
	gnome-disk-utility
	libnotify
	netctl
	networkmanager
	pavucontrol
	pulseaudio
	pulseaudio-alsa
	pulseaudio-bluetooth
	scrot
	wget
	wireless_tools
	git
	ctags
	ncurses
	curl
	rsync
	qt5-quickcontrols2
	qt5-graphicaleffects
	qt5-svg
	dunst
	ranger
	archlabs-networkmanager-dmenu
	sshfs
	rtorrent
	bleachbit
	arandr
	nitrogen
	lxappearance
	tree
	duf
	xinput
	jq
)

list_font=(
	adapta-gtk-theme
	adobe-source-code-pro-fonts
	adobe-source-{code,serif}-pro-fonts
	adobe-source-han-sans-cn-fonts
	adobe-source-han-serif-cn-fonts
	awesome-terminal-fonts
	bluez
	bluez-libs
	bluez-utils
	gsfonts
	noto-fonts
	noto-fonts-emoji
	noto-fonts-emoji
	otf-font-awesome
	terminus-font
	ttf-dejavu
	ttf-droid
	ttf-hack
	ttf-inconsolata
	ttf-liberation
	ttf-ms-fonts
	ttf-roboto
	ttf-roboto	
	unicode-emoji
	xorg-fonts-100dpi
)

list_dev=(
base-devel
	git
	git
	lazygit
	meld	
	neovim
	python-neovim
	python-pip
)

list=(
	libreoffice
	vlc
)

list_aur=(
	bat-cat-git
	gitahead
	nerd-fonts-complete
	nerd-fonts-fira-code
	nerd-fonts-roboto-mono
	networkmanager-dmenu-bluetoothfix-git
	nordic-darker-standard-buttons-theme
	nordic-darker-theme
	nordic-theme
	noto-fonts
	numix-icon-theme-git	
	pamac-aur
	spotify
	ttf-font-awesome
	ttf-meslo
	visual-studio-code-bin
	zeal
)

list_kernel=(
	linux-lts
	linux-lts-headers
)

dthr="$(date '+%Y%m%d%H%M')"
arquivo_log="${dthr}_log.log"
path_download="$HOME/Downloads/IBA"
path_workspace="$HOME/workspace"
path_conf="$HOME/workspace/_conf"
path_pwd="$(pwd)"

#path_download CRIAR

if [ -d "$path_download" ];then
  # se o diretório existir
  touch "$path_download"/"$arquivo_log"  
else
  # se não existir, vai ser criado o diretório
  mkdir "$path_download"; 
  touch "$path_download"/"$arquivo_log"
fi

#path workspace ~/workspace/_conf/

if [ -d "$path_workspace" ];then
  # se o diretório existir
  if ! [ -d "$path_workspace/_conf" ];then
    mkdir "$path_workspace/_conf"
  fi
else
  # se não existir, vai ser criado o diretório
  mkdir "$path_workspace";
  mkdir "$path_workspace/_conf"
fi

# Function Install 

func_install() {
	if pacman -Qi $1 &> /dev/null; then
		echo ""
		echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} [pacman] Pacote "$1" já instalado ${_RESET}"
	else
		echo ""
		echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} [pacman] Pacote "$1" ${_RESET}"

    	sudo pacman -S --noconfirm --needed $1
    fi
}

# Function Install aur

func_install_aur() {
	if yay -Qi $1 &> /dev/null; then
		echo ""
		echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} [yay] Pacote "$1" já instalado ${_RESET}"
	else
		echo ""
		echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} [yay] Pacote "$1" ${_RESET}"

    	paru -S --noconfirm --needed $1
    fi
}

# Function SSD

drivessd () {
	echo -ne "
	Utilizando SSD? (S)im/(N)ão:
	"
	read ssd_drive

	case $ssd_drive in
		s|S|sim|Sim|SIM)
		echo "mountoptions=noatime,compress=zstd,ssd,commit=120" >> setup.conf;;
		n|N|no|NO|No)
		echo "mountoptions=noatime,compress=zstd,commit=120" >> setup.conf;;
		*) echo "Opção errada. Tente novamente";drivessd;;
	esac
}

# CD

cd ${path_download}

# Atualização SO

echo "${_BOLD}${_GREEN}===>${_RESET}${_BOLD} Atualização do SO${_RESET}"

sudo pacman -Sy --noconfirm --needed 
sudo pacman -Su --noconfirm --needed 

# Atualização Kernel LTS

echo "${_BOLD}${_GREEN}===>${_RESET}${_BOLD} Instalação do Kernel LTS${_RESET}"

#sudo pacman -S --noconfirm --needed
count=0
for name in "${list_kernel[@]}" ; do
	count=$[count+1]	
	echo ""
	echo "${_BOLD}${_GREEN}>${_RESET}${_BOLD} Instalando pacote nº "$count" "$name" ${_RESET}"
	func_install $name
done
##sudo grub-mkconfig -o /boot/grub/grub.cfg
## pós install / reboot
## sudo pacman -R linux


echo ""
echo "${_BOLD}${_GREEN}====>${_RESET}${_BOLD} Instalação do pacotes ${_RESET}"

echo ""
echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} SYS ${_RESET}"
count=0

for name in "${list_sys[@]}" ; do
	count=$[count+1]
	#tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	echo ""
	echo "${_BOLD}${_GREEN}>${_RESET}${_BOLD} Instalando pacote nº "$count" "$name" ${_RESET}"
	func_install $name
done

echo ""
echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} Fonts e Themes ${_RESET}"

count=0

for name in "${list_font[@]}" ; do
	count=$[count+1]
	#tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	echo ""
	echo "${_BOLD}${_GREEN}>${_RESET}${_BOLD} Instalando pacote nº "$count" "$name" ${_RESET}"
	func_install $name
done
# reload font cache
fc-cache -vf

# font manager gui
yay -S font-manager

echo ""
echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} Dev ${_RESET}"

count=0

for name in "${list_dev[@]}" ; do
	count=$[count+1]
	#tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	echo ""
	echo "${_BOLD}${_GREEN}>${_RESET}${_BOLD} Instalando pacote nº "$count" "$name" ${_RESET}"
	func_install $name
done

echo ""
echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} Outros ${_RESET}"

count=0
for name in "${list[@]}" ; do
	count=$[count+1]
	#tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	echo ""
	echo "${_BOLD}${_GREEN}>${_RESET}${_BOLD} Instalando pacote nº "$count" "$name" ${_RESET}"
	func_install $name
done

echo ""
echo "${_BOLD}${_GREEN}====>${_RESET}${_BOLD} yay ${_RESET}"

#####
mkdir ${path_download}
cd ${path_download}
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ${path_download}
####

echo ""
echo "${_BOLD}${_GREEN}==>${_RESET}${_BOLD} Pacotes YAY ${_RESET}"

count=0
for name in "${list_aur[@]}" ; do
	count=$[count+1]
	#tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	echo ""
	echo "${_BOLD}${_GREEN}>${_RESET}${_BOLD} Instalando pacote nº "$count" "$name" ${_RESET}"
	func_install_aur $name
done


echo ""
echo "${_BOLD}${_GREEN}====>${_RESET}${_BOLD} Habilitando lightDM${_RESET}"

sudo systemctl enable lightdm -f

cd ${path_download}
git clone https://github.com/jelenis/login-manager.git
cp -r lightdm-theme /usr/share/lightdm-webkit/themes/

echo "--- Instalar o theme"
echo "  Configuração vim /etc/lightdm/lightdm.conf"
echo "  [Seat:*]"
echo "..."
echo "greeter-session=lightdm-webkit2-greeter"
echo "..."
echo ""
echo ""
echo "  Configuração vim /etc/lightdm/lightdm-webkit2-greeter.conf"
echo "  [greeter]"
echo "..."
echo "webkit_theme=lightdm-theme"
echo "..."

echo ""
echo "${_BOLD}${_GREEN}====>${_RESET}${_BOLD} Configurando NeoVim ${_RESET}"
cd ${path_pwd}
mkdir ~/.config/nvim
cp conf/generate.vim  ~/.config/nvim/init.vim
cd ${path_download}

echo ""
echo "${_BOLD}${_GREEN}====>${_RESET}${_BOLD} Configurando Fonts ${_RESET}"
cd ${path_download}
wget https://github.com/google/fonts/archive/main.zip


echo ""
echo "${_BOLD}${_GREEN}====>${_RESET}${_BOLD} Configurando ENV ${_RESET}"
cd ${path_pwd}
cp "${path_download}/conf/env.sh" "${path_conf}/."


echo ""
echo "${_BOLD}${_GREEN}====>${_RESET}${_BOLD} Configurando ZSH ${_RESET}"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ${path_pwd}
if [ -e "~/.zshrc" ] ; then	
	mv "~/.zshrc" "~/.zshrc_""$dthr"
fi
cp "${path_download}/conf/zshrc" "~/.zshrc"

echo ""
echo "${_BOLD}${_GREEN}====>${_RESET}${_BOLD} Configurando SSD ${_RESET}"

drivessd

#path_pwd

## dbeaver?
## + configuração

#tput setaf 7;echo "################################################################"
#echo "You now have a very minimal functional desktop"
#echo "################################################################"
#echo;tput sgr0

#tput setaf 11;
#echo "################################################################"
#echo "Reboot your system"
#echo "################################################################"
#echo;tput sgr0
