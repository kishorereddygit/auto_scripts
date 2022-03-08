#!/usr/bin/env bash

sudo apt update -y
sudo apt upgrade -y
sudo apt-get install git gcc g++ python pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev python3-pip zip pi-bluetooth -y
sudo apt install default-jre -y
sudo apt install default-jdk -y
sudo apt-get install pi-bluetooth avahi-utils -y
sudo apt-get install linux-modules-extra-raspi -y
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
sudo apt install generate-ninja -y
sudo modprobe ip6table_filter
sudo usermod -aG docker $USER
newgrp docker
