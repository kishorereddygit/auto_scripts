#!/usr/bin/env bash

#for OTBR
sudo modprobe ip6table_filter

#For docker
sudo usermod -aG docker $USER
newgrp docker
