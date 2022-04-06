FILE=/home/ubuntu/flag.txt
if test -f "$FILE"; then
bash ./docker_Setup.sh
bash ./building_Apps.sh
rm flag.txt
bash ./remove_scripts.sh
dd.sh v_latest
else
bash ./move_to_root.sh
cd /home/ubuntu
sudo bash ./kernal_patch.sh
sudo rm -rf kernal_patch.sh
sudo bash ./dependencies.sh &&
bash ./test_harness.sh &&
bash ./connectedhomeip.sh &&
sudo bash ./config.sh
touch flag.txt
sudo reboot
fi
