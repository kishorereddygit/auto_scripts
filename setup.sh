#!/usr/bin/env bash

#
# Copyright (c) 2021 Project CHIP Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ROOT_DIR=$(realpath $(dirname "$0")/..)
CHIP_ROOT=$(realpath $(dirname "$0")/chip-certification-tool/backend/third_party/connectedhomeip/repo)

sudo apt update
sudo apt upgrade
sudo apt-get install git gcc g++ python pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev python3-pip zip pi-bluetooth

#Install docker and docker compose
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose
sudo apt update
#Manage Docker as a non-root user
sudo usermod -aG docker $USER
newgrp docker 
docker run hello-world
docker --version
#Get Chip-tool
git clone git@github.com:CHIP-Specifications/chip-certification-tool.git
cd chip-certification-tool
git checkout develop
git submodule update --init --recursive
# cd "$CHIP_ROOT"
# source ./scripts/bootstrap.sh
pip3 install git-archive-all
