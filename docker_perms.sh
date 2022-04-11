#!/usr/bin/env bash

#for OTBR
sudo modprobe ip6table_filter

#For docker
sudo chmod u+x /var/run/docker.sock

#sudo usermod -aG docker $USER
#newgrp docker
