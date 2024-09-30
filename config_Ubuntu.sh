#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install tree -y
sudo apt install gcc -y
sudo apt install g++  -y
sudo apt install gdb -y
sudo apt install make -y
sudo apt install default-jdk -y
sudo apt install jq -y

./config_git.sh