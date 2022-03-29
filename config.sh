#!/usr/bin/env bash

cd ~
sudo cp chip-certification-tool/backend/test_environment.config.example  chip-certification-tool/backend/test_environment.config
ln -s chip-certification-tool/backend/test_environment.config test-harness.config
ln -s chip-certification-tool/backend/third_party/connectedhomeip/repo connectedhomeip
ln -s /etc/netplan/50-cloud-init.yaml network.config
ln -s chip-certification-tool/cli cli
sudo mv rc.local /etc/
sudo mv dbus-fi.w1.wpa_supplicant1.service /etc/systemd/system/
sudo mv wpa_supplicant.conf /etc/wpa_supplicant/
sudo chmod +x /etc/rc.local
sudo systemctl enable rc-local
cd cli
source $HOME/.poetry/env && poetry update && poetry install