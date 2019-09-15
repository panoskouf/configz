#!/bin/bash

# Just cp all files in this folder

cp -rf ~/.XCompose .
cp -rf /etc/hosts .

mkdir scripts
rm -rf scripts/*
cp -rf /usr/local/scripts/* scripts

# todo..
