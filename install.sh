#!/bin/bash
# Shell script to install i3 configuration

# 1. check and warn if files already exists
# 2. Install Dependencies
# 3. Copy configuration to proper folders

red=$(tput setaf 1)
bold=$(tput bold)
normal=$(tput sgr0)

echo '---------------------------------------------'
echo ' 1 - Checking for conflicts                  '
echo '---------------------------------------------'
echo

if [[ -d "$HOME/.config/i3" || -d "$HOME/.config/i3blocks" || -f "$HOME/.config/compton.conf" ]]; then
    
    echo "${red}i3 configuration files already exist.${normal}"
    echo
    echo "please backup and delete your files first!"
    echo "then re-run the installer script."
    echo
    echo "${bold}- Conflicts:${normal}"
    if [ -d "$HOME/.config/i3" ]; then echo $HOME/.config/i3/; fi
    if [ -d "$HOME/.config/i3blocks" ]; then echo $HOME/.config/i3blocks/; fi
    if [ -f "$HOME/.config/compton.conf" ]; then echo $HOME/.config/compton.conf; fi

    exit 1
fi


echo
echo '---------------------------------------------'
echo ' 2 - Installing software dependencies        '
echo '                                             '
echo ' Arch linux supported with aurman for AUR    '
echo '---------------------------------------------'
echo

if ! [ -x "$(command -v aurman)" ]; then
    echo 'Aurman must be install installed.'
    exit 1
fi

aurman -S i3-gaps i3-wm i3blocks i3lock i3status compton feh \
dmenu lxappearance gnome-screenshot gnome-terminal termite \
nerd-fonts-source-code-pro noto-fonts

echo
echo '---------------------------------------------'
echo ' 3 - Copying configurations                  '
echo '---------------------------------------------'
echo

echo 'Copying configuration files'
mkdir -p $HOME/.config/
cp -r config/* $HOME/.config/

echo 'Copying wallpapers'
mkdir -p $HOME/Pictures/Wallpapers/
cp -r wallpapers/* $HOME/Pictures/Wallpapers/