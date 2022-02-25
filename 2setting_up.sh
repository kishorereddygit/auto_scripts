#!/usr/bin/env bash
git clone --recursive git@github.com:CHIP-Specifications/chip-certification-tool.git
cd chip-certification-tool/frontend/
git checkout develop
cd ..
cd backend/
git checkout develop
cd third_party/connectedhomeip/repo/
git checkout 5cbe2931f64e16a44fc843e148325909fbe1511d
echo "Edit these files: sudo nano /etc/systemd/system/dbus-fi.w1.wpa_supplicant1.service "
echo " and sudo nano /etc/wpa_supplicant/wpa_supplicant.conf and REBOOT "
