#!/usr/bin/env bash

cd ~
cd connectedhomeip/
source ./scripts/bootstrap.sh
gn gen out/debug --args='chip_mdns="platform" chip_inet_config_enable_ipv4=false'
ninja -C out/debug
scripts/examples/gn_build_example.sh      examples/all-clusters-app/linux/      examples/all-clusters-app/linux/out/all-clusters-app   chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/bridge-app/linux/      examples/bridge-app/linux/out/bridge-app chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/tv-app/linux/      examples/tv-app/linux/out/tv-app chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/tv-casting-app/linux/      examples/tv-casting-app/linux/out/tv-casting-app chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/lighting-app/linux/      examples/lighting-app/linux/out/lighting-app chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh      examples/thermostat/linux/      examples/thermostat/linux/out/thermostat chip_inet_config_enable_ipv4=false
scripts/examples/gn_build_example.sh examples/ota-provider-app/linux examples/ota-provider-app/linux/out/host 'chip_config_network_layer_ble=false'
scripts/examples/gn_build_example.sh examples/ota-requestor-app/linux examples/ota-requestor-app/linux/out/host 'chip_config_network_layer_ble=false'
scripts/examples/gn_build_example.sh examples/door-lock-app/linux/ out/door-lock-app chip_inet_config_enable_ipv4=false
cd ~
cd apps
mv ../connectedhomeip/out/debug/chip-tool chip-tool
mv ../connectedhomeip/out/debug/chip-shell chip-shell
mv ../connectedhomeip/out/debug/chip-cert chip-cert
mv ../connectedhomeip/examples/all-clusters-app/linux/out/all-clusters-app/chip-all-clusters-app all-cluster-app
mv ../connectedhomeip/examples/lighting-app/linux/out/lighting-app/chip-lighting-app lighting-app
mv ../connectedhomeip/examples/tv-casting-app/linux/out/tv-casting-app/chip-tv-casting-app tv-casting-app
mv ../connectedhomeip/examples/tv-app/linux/out/tv-app/chip-tv-app tv-app
mv ../connectedhomeip/examples/bridge-app/linux/out/bridge-app/chip-bridge-app bridge-app
mv ../connectedhomeip/examples/thermostat/linux/out/thermostat/thermostat-app thermostat-app
mv ../connectedhomeip/examples/ota-requestor-app/linux/out/host/chip-ota-requestor-app ota-requestor-app
mv ../connectedhomeip/examples/ota-provider-app/linux/out/host/chip-ota-provider-app ota-provider-app
mv ../connectedhomeip/out/door-lock-app/chip-door-lock-app door-lock-app