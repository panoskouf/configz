#!/bin/bash

# Just cp all files in this folder

cp -rf ~/.aliases .
cp -rf ~/.bashrc .
cp -rf ~/.bash_prompt .
cp -rf ~/.dircolors .
cp -rf ~/.emacs.d/init.el .
cp -rf ~/.config/fish/config.fish .
cp -rf ~/.XCompose .

mkdir plank_themes
rm -rf plank_themes/*
cp -rf ~/.local/share/plank/themes/* plank_themes

mkdir scripts
rm -rf scripts/*
cp -rf /usr/local/scripts/* scripts

mkdir vscode
rm -rf vscode/*
cp -rf ~/.config/Code/User/* vscode
rm -rf vscode/globalStorage
rm -rf vscode/workspaceStorage

# todo..
