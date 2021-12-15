#!/usr/bin/env bash

ROOT_DIR=$(realpath $(dirname "$0"))
SDK_DIR="$HOME/python"
CERT_TOOL_DIR="$HOME/chip-certification-tool"
APPS="$HOME/apps"
LOCAL="$HOME/etc/systemd/system"

# move and install python-dev-controller
#rm -rf "$SDK_DIR" # delete old stuff
mkdir -p "$SDK_DIR"
mv "$ROOT_DIR/python_env" "$SDK_DI/"
mv "$ROOT_DIR/python_lib" "$SDK_DI/"
pip3 install --upgrade --force-reinstall --no-cache-dir "$SDK_DI/python_lib/controller/python/chip-0.0-cp37-abi3-linux_aarch64.whl"

#Deleting previous images and containers created 
docker image prune -a --force
docker system prune --force

# Copy tool config
cp "$CERT_TOOL_DIR/backend/app/tool.config.example" "$CERT_TOOL_DIR/backend/app/tool.config"

# Symlink backend config
rm "$HOME/test-harness.config"
ln -s "$CERT_TOOL_DIR/backend/app/tool.config" "$HOME/test-harness.config"

# Symlink CLI
rm "$HOME/cli"
ln -s "$CERT_TOOL_DIR/cli" "$HOME/cli"

# Copy scripts for auto-start
sudo rm /etc/rc.local
sudo mv "$ROOT_DIR/artifact/rc.local" /etc/rc.local

#Scripts for starting docker automatically on boot
#sudo mv "$ROOT_DIR/artifact/rc.local.service" /etc/systemd/system/rc-local.service
sudo chmod +x /etc/rc.local
sudo systemctl enable rc-local
sudo systemctl start rc-local.service

rm "$HOME/start-test-harness.sh"
mv "$ROOT_DIR/artifact/start-test-harness.sh" "$HOME/start-test-harness.sh"

# Stop and build new docker images for test harness
cd "$CERT_TOOL_DIR"
docker-compose down
./scripts/build-no-cache.sh

# Build backend managed dockers
cd "$CERT_TOOL_DIR/backend"
./scripts/build_managed_docker_images.sh

#Start the docker service
cd "$CERT_TOOL_DIR"
docker-compose up -d

#Delete bloat files
cd "$ROOT_DIR"
rm install_dependencies.sh
rm unpack_in_pi.sh
