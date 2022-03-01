#!/usr/bin/env bash
cd ~/chip-certification-tool/
docker-compose down
./scripts/build-no-cache.sh
cd backend/
./scripts/build_managed_docker_images.sh
cd ..
docker-compose up
echo "Edit these files: sudo nano /etc/systemd/system/dbus-fi.w1.wpa_supplicant1.service "
echo " and sudo nano /etc/wpa_supplicant/wpa_supplicant.conf and REBOOT "
