#!/usr/bin/sh

NVZ=~/.config/nvz
export NVZ

rm -rf $NVZ

mkdir -p $NVZ/share
mkdir -p $NVZ/nvim

stow --restow --target=$NVZ/nvim .

alias nvz='XDG_DATA_HOME=$NVZ/share XDG_CONFIG_HOME=$NVZ nvim' 
