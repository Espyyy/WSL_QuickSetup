#!/bin/bash

#    WSL_QuickSetup
#    Copyright (C) 2024  Maurício Sardinha
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.


sudo apt update
sudo apt upgrade -y
sudo apt install tree -y
sudo apt install gcc -y
sudo apt install g++  -y
sudo apt install gdb -y
sudo apt install make -y
sudo apt install default-jdk -y
sudo apt install jq -y
sudo apt autoremove -y

./config_git.sh