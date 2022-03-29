#!/usr/bin/env bash

RADIO=/dev/ttyACM0
while getopts :r: flag
do
    case "${flag}" in
        r) RADIO=${OPTARG};;
    esac
done

echo "Using radio device: $RADIO (override by providing a different device with flag -r. Eg. \"-r /dev/ttyACM0\""
echo "Will start web interface on port 8080"
sleep 2
sudo docker run --sysctl "net.ipv6.conf.all.disable_ipv6=0 net.ipv4.conf.all.forwarding=1 net.ipv6.conf.all.forwarding=1" -p 8080:80 --dns=127.0.0.1 -it --volume /dev/ttyACM0:/dev/ttyACM0 --privileged connectedhomeip/otbr:te8 --radio-url spinel+hdlc+uart:///dev/ttyACM0
