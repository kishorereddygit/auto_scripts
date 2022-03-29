#!/usr/bin/env bash

cd ~
sudo cp chip-certification-tool/backend/test_environment.config.example  chip-certification-tool/backend/test_environment.config
ln -s chip-certification-tool/backend/test_environment.config test-harness.config
ln -s chip-certification-tool/backend/third_party/connectedhomeip/repo connectedhomeip
ln -s /etc/netplan/50-cloud-init.yaml network.config
ln -s chip-certification-tool/cli cli
sudo mv artifacts/dbus-fi.w1.wpa_supplicant1.service /etc/systemd/system/
sudo mv artifacts/wpa_supplicant.conf /etc/wpa_supplicant/
mv artifacts/start_otbr_setup.sh ~
mv artifacts/start_test_harness.sh ~
rm -rf artifacts/
sudo chmod u+x start_otbr_setup.sh
sudo chmod u+x start_test_harness.sh
cd cli
source $HOME/.poetry/env && poetry update && poetry install
