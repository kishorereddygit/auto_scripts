#!/usr/bin/env bash

cd ~
git clone --recursive git@github.com:project-chip/connectedhomeip.git
cd connectedhomeip/
git checkout master
cd ~
mkdir apps
