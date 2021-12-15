#!/usr/bin/env bash
ROOT_DIR=$(realpath $(dirname "$0")/..)
CHIP_ROOT=$(realpath $(dirname "$0")/chip-certification-tool/backend/third_party/connectedhomeip/repo)

#Edit the comit or specific branch Needed
connectedhomeip="master"
frontend="new-ui/main"
backend="develop"
main="develop"
#Get Chip-tool
git clone --recursive git@github.com:CHIP-Specifications/chip-certification-tool.git
cd chip-certification-tool

git checkout $main
if [ $backend != "" ]
then
cd backend
git checkout $backend
git pull
fi
if [ $connectedhomeip != "" ]
then
cd third_party/connectedhomeip/repo
git checkout $connectedhomeip
git pull
fi
if [ $frontend != "" ]
then
cd ../../../../frontend
git checkout $frontend
git pull
fi

git submodule update --init --recursive

cd "$CHIP_ROOT"
source ./scripts/bootstrap.sh

sudo pip3 install git-archive-all