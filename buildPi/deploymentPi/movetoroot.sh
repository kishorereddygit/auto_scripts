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
cd ..
mkdir apps
cd To_pi
mv unpack_in_pi.sh ~
mv install_dependencies.sh ~
mv artifact/ ~
#MovingApps to Different Directory
mv chip-all-clusters-app ~/apps
mv chip-ota-provider-app ~/apps
mv chip-tool ~/apps
mv chip-tv-app ~/apps
mv python_env ~
mv chip-bridge-app ~/apps
mv chip-lighting-app ~/apps
mv chip-ota-requestor-app ~/apps
mv chip-tool-ipv6only ~/apps
mv chip-tv-casting-app ~/apps
mv python_lib ~
mv thermostat-app ~/apps
mv chip-certification-tool.tar.gz ~
cd ..
rm -rf To_pi
cd ..