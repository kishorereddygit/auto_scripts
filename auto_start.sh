FILE=/home/ubuntu/flag.txt
if test -f "$FILE"; then
bash ./docker_Setup.sh
bash ./building_Apps.sh
rm flag.txt
bash ./remove_scripts.sh
sudo cloud-init clean
dd.sh v_latest
else
bash ./move_to_root.sh 
cd ~
sudo bash ./kernal_patch.sh 
bash ./dependencies.sh &&
cd ~
bash ./test_harness.sh &&
bash ./connectedhomeip.sh &&
bash ./config.sh
touch flag.txt
sudo reboot
fi
