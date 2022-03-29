FILE=/home/ubuntu/flag.txt
if test -f "$FILE"; then
bash ./docker_Setup.sh
bash ./building_Apps.sh
rm flag.txt
else
bash ./dependencies.sh
bash ./move_to_root.sh
bash ./test_harness.sh
bash ./connectedhomeip.sh
bash ./config.sh
touch flag.txt
sudo reboot
fi
