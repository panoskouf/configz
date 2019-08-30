#!/bin/bash

# Just cp all files in this folder

cp -rf ~/.XCompose .
cp -rf /etc/hosts .

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
