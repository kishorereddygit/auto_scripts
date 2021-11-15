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
ROOT_DIR=$(realpath $(dirname "$0"))
SDK_DIR="$HOME/connectedhomeip"
PYTHON_OUT_DIR="$SDK_DIR/out"
CERT_TOOL_DIR="$HOME/chip-certification-tool"
APPS="$HOME/apps"

mkdir $APPS

# Move chip binaries to home
mv "$ROOT_DIR/chip-tool" "$APPS/" 
mv "$ROOT_DIR/chip-tool-ipv6only" "$APPS/"
mv "$ROOT_DIR/chip-all-clusters-app" "$APPS/" 
mv "$ROOT_DIR/chip-lighting-app" "$APPS/"
mv "$ROOT_DIR/chip-bridge-app" "$APPS/" 
mv "$ROOT_DIR/thermostat-app" "$APPS/" 
mv "$ROOT_DIR/chip-ota-provider-app" "$APPS/"
mv "$ROOT_DIR/chip-ota-requestor-app" "$APPS/"
mv "$ROOT_DIR/chip-tv-app" "$APPS/"
mv "$ROOT_DIR/chip-tv-casting-app" "$APPS/"

# move and install python-dev-controller
rm -rf "$SDK_DIR" # delete old stuff
mkdir -p "$SDK_DIR/out"
mv "$ROOT_DIR/python_env" "$PYTHON_OUT_DIR/"
mv "$ROOT_DIR/python_lib" "$PYTHON_OUT_DIR/"
pip3 install --upgrade --force-reinstall --no-cache-dir "$PYTHON_OUT_DIR/python_lib/controller/python/chip-0.0-cp37-abi3-linux_aarch64.whl"

# Unpack cert tool
sudo rm -rf "$CERT_TOOL_DIR"
tar -xvf "$ROOT_DIR/chip-certification-tool.tar.gz" -C "$HOME"
rm "$ROOT_DIR/chip-certification-tool.tar.gz"

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
sudo mv "$ROOT_DIR/rc.local" /etc/rc.local

rm "$HOME/start-test-harness.sh"
mv "$ROOT_DIR/start-test-harness.sh" "$HOME/start-test-harness.sh"

# Stop and build new docker images for test harness
cd "$CERT_TOOL_DIR"
docker-compose down
./scripts/build-no-cache.sh

# Build backend managed dockers
cd "$CERT_TOOL_DIR/backend"
./scripts/build_managed_docker_images.sh
