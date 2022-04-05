#!/usr/bin/env bash

cd /home/ubuntu
git clone --recursive git@github.com:project-chip/connectedhomeip.git
cd connectedhomeip/
git checkout master
cd /home/ubuntu
mkdir apps
