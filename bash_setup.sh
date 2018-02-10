#!/bin/bash

# Install trash-ci
echo -e "\e[1;31mInstalling trash-cli\e[0m"
sudo apt install trash-cli

# Install clip
echo -e "\e[1;31mInstalling xlcip\e[0m"
sudo apt install xclip

# Install GVim
echo -e "\e[1;31mInstalling vim-gnome\e[0m"
sudo apt install vim-gnome

# Take a backup of the existing bashrc
echo -e "\e[1;31mBacking up the existing bashrc\e[0m"
if [ -e ~/.bashrc ]; then
    mv ~/.bashrc ~/bashrc-`date +%F-T-%T`
fi

# Setup the bashrc
echo -e "\e[1;31mCopying the new bashrc\e[0m"
cp bashrc ~/.bashrc

echo -e "\e[1;31mBASH SETUP DONE. \e[0m"
