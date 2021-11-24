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

ROOT_DIR=$(realpath $(dirname "$0")/..)
CHIP_ROOT=$(realpath $(dirname "$0")/chip-certification-tool/backend/third_party/connectedhomeip/repo)
connectedhomeip=""
frontend=""
backend=""
main="master"

while getopts m:b:f:c: flag
do
	case "${flag}" in
		m) main=${OPTARG};;
		b) backend=${OPTARG};;		
		f) frontend=${OPTARG};;
		c) connectedhomeip=${OPTARG};;		
		\?) echo "Invalid option -$OPTARG" >&2
		    exit 1
		    ;;
	esac
done
#Get Chip-tool
git clone git@github.com:CHIP-Specifications/chip-certification-tool.git
cd chip-certification-tool
git checkout $main
if [ $backend != "" ]
then
cd backend
git checkout $backend
fi
if [ $connectedhomeip != "" ]
then
cd third_party/connectedhomeip/repo
git checkout $connectedhomeip
fi
if [ $frontend != "" ]
then
cd frontend
git checkout $frontend
fi
git submodule update --init --recursive
# cd "$CHIP_ROOT"
# source ./scripts/bootstrap.sh
pip3 install git-archive-all
