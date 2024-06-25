#!/bin/bash

# Install tmux
echo -e "\e[1;31mInstalling tmux\e[0m"
sudo apt install -y tmux

# Install trash-ci
echo -e "\e[1;31mInstalling trash-cli\e[0m"
sudo apt install -y trash-cli

# Install clip
echo -e "\e[1;31mInstalling xlcip\e[0m"
sudo apt install -y xclip

# Install GVim
echo -e "\e[1;31mInstalling vim-gnome\e[0m"
sudo apt install -y vim-gnome

# Install bc
echo -e "\e[1;31mInstalling bc\e[0m"
sudo apt install -y bc

# Take a backup of the existing bashrc
echo -e "\e[1;31mBacking up the existing bashrc\e[0m"
if [ -e ~/.bashrc ]; then
    mv ~/.bashrc ~/bashrc-`date +%F-T-%T`
fi

# Setup the bashrc
echo -e "\e[1;31mCopying the new bashrc\e[0m"
cp bashrc ~/.bashrc


# Take a backup of the existing tmux config
echo -e "\e[1;31mBacking up the existing tmux config\e[0m"
if [ -e ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/tmux.conf-`date +%F-T-%T`
fi

# Copy the new tmux config 
echo -e "\e[1;31mCopying the new tmux config\e[0m"
cp tmux.conf ~/.tmux.conf

echo -e "\e[1;31mBASH SETUP DONE. \e[0m"


# Settup dust
echo -e "\e[1;31mInstalling dust\e[0m"
sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install || wget -q https://pacstall.dev/q/install -O -)"
pacstall -I dust-bin

# Settup btop
echo -e "\e[1;31mInstalling btop\e[0m"
sudo snap install btop

# Setup fzf
sudo apt install fzf

#Install batcat
sudo apt install bat

# Settup zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash


