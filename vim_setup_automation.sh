#!/bin/bash

# Install vim 8.0
echo -e "\e[1;31mAdding PPA to install Vim 8.0 ...\e[0m"
sudo apt-add-repository ppa:jonathonf/vim
sudo apt update
echo -e "\e[1;31m~~~~~ INSTALLING VIM 8.0 ~~~~~~\e[0m"
sudo apt install -y vim
echo -e "\e[1;31m~~~~~ VIM 8.0 INSTALL COMPLETE ~~~~~\e[0m"

# Install vim ruby (required for LustyBufferExplorer plugin)
echo -e "\e[1;31mInstalling vim ruby...\e[0m"
sudo apt install -y vim-ruby
echo -e "\e[1;31m~~~~~ vim-ruby INSTALL COMPLETE ~~~~~\e[0m"

# Install exuberant ctags
echo -e "\e[1;31mInstalling exuberant ctags ...\e[0m"
sudo apt install -y exuberant-ctags
echo -e "\e[1;31m~~~~~ exuberant-ctags INSTALL COMPLETE ~~~~~\e[0m"


echo -e "\e[1;31mCopying vimrc\e[0m"
# backup the exsitiing vimrc and copy the new vimrc file

if [ -e ~/.vimrc ] ; then
    echo -e "\e[1;31mBacking up the existing .vimrc ..\e[0m"
    mv ~/.vimrc ~/vimrc-`date +%F-T-%T`
fi

cp vimrc ~/.vimrc

# backup the exsitiing .vim folder and setting up the new .vim file
if [ -e ~/.vim ] ; then
    echo -e "\e[1;31mBacking up the existing .vim folder ..\e[0m"
    mv ~/.vim ~/vim-`date +%F-T-%T`
fi

# move to the home folder
cd

echo -e "\e[1;31mCreating autoload folder\e[0m"
# Create autoload folder for downloading pathogen
mkdir -p ~/.vim/autoload

echo -e "\e[1;31mDownloading pathogen\e[0m"
# Download pathogen to manage runtime path of other plugins
cd ~/.vim/autoload
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload/pathogen.vim .

echo -e "\e[1;31mCreating bundle folder to download other plugins\e[0m"
# Create folder for downloading other plugins
mkdir -p ~/.vim/bundle

# Move to bundle folder and start downloading plugins
cd ~/.vim/bundle

echo -e "\e[1;31mDownloading other plugins\e[0m"
# bufexplorer
git clone https://github.com/jlanzarotta/bufexplorer.git

# LustyExplorer
git clone https://github.com/vim-scripts/LustyExplorer.git

# nerdtree
git clone https://github.com/scrooloose/nerdtree.git

# vim-fugitive (for git)
git clone https://github.com/tpope/vim-fugitive.git

# vim-visual-increment
git clone https://github.com/triglav/vim-visual-increment.git

# sessionman
git clone https://github.com/vim-scripts/sessionman.vim.git

# taglist
git clone https://github.com/vim-scripts/taglist.vim.git

# tlib_vim
git clone https://github.com/tomtom/tlib_vim.git

# vim-addon-mw-utils
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git

# snipmate
git clone https://github.com/garbas/vim-snipmate.git

# vim-snippets
git clone https://github.com/honza/vim-snippets.git

# CtrlP for file search
git clone https://github.com/kien/ctrlp.vim.git

# vim-bookmarks
git clone https://github.com/MattesGroeger/vim-bookmarks.git

# vim-color-schemes
git clone https://github.com/rafi/awesome-vim-colorschemes.git

echo -e "\e[1;31mINSTALL COMPLETE ...\e[0m"
