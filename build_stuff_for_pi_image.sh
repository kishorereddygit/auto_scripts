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
OUT_DEST_PATH="$ROOT_DIR/send_to_pi"

# Setup environment
source "$CHIP_ROOT/scripts/activate.sh"

# Create Output folder
if [ -d "$OUT_DEST_PATH" ] 
then
    rm -r "$OUT_DEST_PATH"
fi
mkdir -p "$OUT_DEST_PATH"

# chip-tool
CHIP_TOOL_ROOT="$CHIP_ROOT/examples/chip-tool"
CHIP_TOOL_EXEC_PATH="$CHIP_TOOL_ROOT/out/host"
CHIP_TOOL_IPV6ONLY_EXEC_PATH="$CHIP_TOOL_ROOT/out-ipv6-only/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$CHIP_TOOL_ROOT" "$CHIP_TOOL_EXEC_PATH" 'chip_mdns="platform"'
mv $CHIP_TOOL_EXEC_PATH/chip-tool $OUT_DEST_PATH/chip-tool

"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$CHIP_TOOL_ROOT" "$CHIP_TOOL_IPV6ONLY_EXEC_PATH" 'chip_mdns="platform" chip_inet_config_enable_ipv4=false'
mv $CHIP_TOOL_IPV6ONLY_EXEC_PATH/chip-tool $OUT_DEST_PATH/chip-tool-ipv6only

# Sample app: all-cluster
ALL_CLUSTER_ROOT="$CHIP_ROOT/examples/all-clusters-app/linux"
ALL_CLUSTER_EXEC_PATH="$ALL_CLUSTER_ROOT/out/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$ALL_CLUSTER_ROOT" "$ALL_CLUSTER_EXEC_PATH"
mv $ALL_CLUSTER_EXEC_PATH/chip-all-clusters-app $OUT_DEST_PATH/

# Sample app: Lighting
LIGHTING_ROOT="$CHIP_ROOT/examples/lighting-app/linux"
LIGHTING_EXEC_PATH="$LIGHTING_ROOT/out/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$LIGHTING_ROOT" "$LIGHTING_EXEC_PATH" 
mv $LIGHTING_EXEC_PATH/chip-lighting-app $OUT_DEST_PATH/

# Sample app: Bridge
BRIDGE_ROOT="$CHIP_ROOT/examples/bridge-app/linux"
BRIDGE_EXEC_PATH="$BRIDGE_ROOT/out/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$BRIDGE_ROOT" "$BRIDGE_EXEC_PATH" 
mv $BRIDGE_EXEC_PATH/chip-bridge-app $OUT_DEST_PATH/

# Sample app: Thermosat
THERMOSTAT_ROOT="$CHIP_ROOT/examples/thermostat/linux"
THERMOSTAT_EXEC_PATH="$THERMOSTAT_ROOT/out/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$THERMOSTAT_ROOT" "$THERMOSTAT_EXEC_PATH" 
mv $THERMOSTAT_EXEC_PATH/thermostat-app $OUT_DEST_PATH/

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

# Sample app: TV
TV_ROOT="$CHIP_ROOT/examples/tv-app/linux"
TV_EXEC_PATH="$TV_ROOT/out/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$TV_ROOT" "$TV_EXEC_PATH"
mv $TV_EXEC_PATH/chip-tv-app $OUT_DEST_PATH

# Sample app: TV-casting
TV_CASTING_ROOT="$CHIP_ROOT/examples/tv-casting-app/linux"
TV_CASTING_EXEC_PATH="$TV_CASTING_ROOT/out/host"
"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$TV_CASTING_ROOT" "$TV_CASTING_EXEC_PATH"
mv $TV_CASTING_EXEC_PATH/chip-tv-casting-app $OUT_DEST_PATH

# Build python-dev-controller
"$CHIP_ROOT/scripts/build_python.sh" --chip_detail_logging true --chip_mdns platform
PYTHON_ENV_OUT="$CHIP_ROOT/out/python_env"
mv "$PYTHON_ENV_OUT" $OUT_DEST_PATH/
PYTHON_LIB_OUT="$CHIP_ROOT/out/python_lib"
mv "$PYTHON_LIB_OUT" $OUT_DEST_PATH/

# Archive Test Harness repo
cd "$CERT_TOOL_ROOT"
git archive-all -v "$OUT_DEST_PATH/chip-certification-tool.tar.gz"

# Copy helper scripts
cp -r $CHIP_ROOT $OUT_DEST_PATH/
cp "$ROOT_DIR/InPi/unpack.sh" $OUT_DEST_PATH/
cp "$ROOT_DIR/InPi/rc.local" $OUT_DEST_PATH/
cp "$ROOT_DIR/InPi/start-test-harness.sh" $OUT_DEST_PATH/

# compress as zip
cd "$ROOT_DIR"
zip send_to_pi.zip -r send_to_pi
rm -rf "$OUT_DEST_PATH"
