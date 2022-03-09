#!/usr/bin/env bash

cd ~
sudo cp chip-certification-tool/backend/test_environment.config.example  chip-certification-tool/backend/test_environment.config
ln -s chip-certification-tool/backend/test_environment.config test-harness.config
ln -s chip-certification-tool/backend/third_party/connectedhomeip/repo connectedhomeip
ln -s /etc/netplan/50-cloud-init.yaml network.config
ln -s chip-certification-tool/cli cli
sudo mv rc.local /etc/
cd cli
source $HOME/.poetry/env && poetry update && poetry install
