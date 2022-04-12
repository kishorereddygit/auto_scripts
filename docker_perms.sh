#!/usr/bin/env bash

#for OTBR
sudo modprobe ip6table_filter

#For docker
#sudo chown $USER /var/run/docker.sock

sudo usermod -a -G docker $USER
#newgrp docker
