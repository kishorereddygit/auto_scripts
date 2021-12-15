#!/usr/bin/env bash
set -e

ROOT_DIR=$(realpath $(dirname "$0"))
CERT_TOOL_ROOT="$ROOT_DIR/chip-certification-tool"
CHIP_ROOT="$CERT_TOOL_ROOT/backend/third_party/connectedhomeip/repo"
OUT_DEST_PATH="$ROOT_DIR/Root"
GN_PATH="$CERT_ROOT/out/debug/standalone/"

# Setup environment
source "$CHIP_ROOT/scripts/activate.sh"

# Create Output folder
if [ -d "$OUT_DEST_PATH" ] 
then
    rm -r "$OUT_DEST_PATH"
fi
mkdir -p "$OUT_DEST_PATH"

./$CHIP_ROOT/gn_build.sh
mv $GN_PATH $OUT_DEST_PATH

"$CHIP_ROOT/scripts/examples/gn_build_example.sh" "$CHIP_TOOL_ROOT" "$CHIP_TOOL_IPV6ONLY_EXEC_PATH" 'chip_mdns="platform" chip_inet_config_enable_ipv4=false'
mv $CHIP_TOOL_IPV6ONLY_EXEC_PATH/chip-tool $OUT_DEST_PATH/chip-tool-ipv6only

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