#!/usr/bin/env bash
cd ~
cd chip-certification-tool/backend/third_party/connectedhomeip/repo/
source ./scripts/bootstrap.sh
./gn_build.sh
scripts/examples/gn_build_example.sh examples/ota-provider-app/linux examples/ota-provider-app/linux/out/host 'chip_config_network_layer_ble=false'
scripts/examples/gn_build_example.sh examples/ota-requestor-app/linux examples/ota-requestor-app/linux/out/host 'chip_config_network_layer_ble=false'
cd ~
mkdir apps
cd apps
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/chip-all-clusters-app all-clusters-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/chip-lighting-app lighting-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/chip-tv-casting-app tv-casting-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/chip-cert cert
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/chip-tool chip-tool
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/chip-tv-app tv-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/chip-bridge-app bridge-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/chip-shell shell
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/out/debug/standalone/thermostat-app thermostat-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/ota-requestor-app/linux/out/host/chip-ota-requestor-app ota-requestor-app
ln -s ../chip-certification-tool/backend/third_party/connectedhomeip/repo/examples/ota-provider-app/linux/out/host/chip-ota-provider-app ota-provider-app
cd ~
cp chip-certification-tool/backend/app/tool.config.example chip-certification-tool/backend/app/tool.config
ln -s chip-certification-tool/backend/app/tool.config test-harness.config
ln -s chip-certification-tool/cli cli
ln -s /etc/netplan/50-cloud-init.yaml network.config
echo "Add READme, start-test-harness.sh and rc.local"
