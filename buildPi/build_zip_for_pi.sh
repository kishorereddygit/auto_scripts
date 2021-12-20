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

# exit when a command below fails
set -e


ROOT_DIR=$(realpath $(dirname "$0"))
CERT_TOOL_ROOT="$ROOT_DIR/chip-certification-tool"
CHIP_ROOT="$CERT_TOOL_ROOT/backend/third_party/connectedhomeip/repo"
OUT_DEST_PATH="$ROOT_DIR/To_pi"

# Setup environment
source "$CHIP_ROOT/scripts/activate.sh"

# Create Output folder
if [ -d "$OUT_DEST_PATH" ] 
then
    rm -r "$OUT_DEST_PATH"
fi
mkdir -p "$OUT_DEST_PATH"

cd $CHIP_ROOT
./gn_build.sh
mv out apps
mv apps $OUT_DEST_PATH/

# Sample app: OTA Provider
OTA_PROVIDER_ROOT="$CHIP_ROOT/examples/ota-provider-app/linux"
OTA_PROVIDER_EXEC_PATH="$OTA_PROVIDER_ROOT/out/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$OTA_PROVIDER_ROOT" "$OTA_PROVIDER_EXEC_PATH" 'chip_config_network_layer_ble=false'
mv $OTA_PROVIDER_EXEC_PATH/chip-ota-provider-app $OUT_DEST_PATH/

# Sample app: OTA Requestor
OTA_REQUESTOR_ROOT="$CHIP_ROOT/examples/ota-requestor-app/linux"
OTA_REQUESTOR_EXEC_PATH="$OTA_REQUESTOR_ROOT/out/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$OTA_REQUESTOR_ROOT" "$OTA_REQUESTOR_EXEC_PATH" 'chip_config_network_layer_ble=false'
mv $OTA_REQUESTOR_EXEC_PATH/chip-ota-requestor-app $OUT_DEST_PATH/

"$CHIP_ROOT/scripts/build_python.sh" --chip_detail_logging true --chip_mdns platform
PYTHON_ENV_OUT="$CHIP_ROOT/out/python_env"
mv "$PYTHON_ENV_OUT" $OUT_DEST_PATH/
PYTHON_LIB_OUT="$CHIP_ROOT/out/python_lib"
mv "$PYTHON_LIB_OUT" $OUT_DEST_PATH/

# Archive Test Harness repo
cd "$CERT_TOOL_ROOT"
git-archive-all -v "$OUT_DEST_PATH/chip-certification-tool.tar.gz"

# Copy helper scripts
cp -r "$ROOT_DIR/READme.md" $OUT_DEST_PATH/
cp -r "$ROOT_DIR/install_dependencies.sh" $OUT_DEST_PATH/
cp -r "$ROOT_DIR/deploymentPi/artifact" $OUT_DEST_PATH/
cp -r "$ROOT_DIR/deploymentPi/unpack_in_pi.sh" $OUT_DEST_PATH/
cp -r "$ROOT_DIR/deploymentPi/movetoroot.sh" $OUT_DEST_PATH/

# compress as zip
cd "$ROOT_DIR"
zip To_pi.zip -r To_pi
rm -rf "$OUT_DEST_PATH"
