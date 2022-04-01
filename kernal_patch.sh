#!/usr/bin/env bash

sudo apt update -y
sudo apt-get install linux-raspi-tools-5.13.0-1022 -y
sudo apt upgrade -y
rm kernal_patch.sh 
sudo reboot 
