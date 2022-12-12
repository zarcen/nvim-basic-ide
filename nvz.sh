#!/usr/bin/sh

export NVZ=~/.config/nvz

alias nvz='XDG_DATA_HOME=$NVZ/share XDG_CONFIG_HOME=$NVZ nvim' 

nvz
