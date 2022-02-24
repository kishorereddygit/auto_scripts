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
sudo docker run -it --rm --network host --privileged -v $RADIO:/dev/radio connectedhomeip/otbr:te8 --radio-url spinel+hdlc+uart:///dev/radio -B wlan0
