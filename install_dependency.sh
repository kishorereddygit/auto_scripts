#!/usr/bin/env bash
mv building_apps.sh ~
mv docker_all.sh ~
mv rc.local ~
mv setting_up.sh ~
mv start-test-harness.sh ~
mv chip-certification-tool ~
sudo apt update -y
sudo apt upgrade -y
sudo apt-get install git gcc g++ python pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev python3-pip zip pi-bluetooth -y
sudo apt install default-jre -y
sudo apt install default-jdk -y
#Install docker and docker compose
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo pip3 install docker-compose
echo "REBOOT PI"
echo "ssh-keygen -o"
rm -rf auto_scripts
