FILE=/home/ubuntu/flag.txt
if test -f "$FILE"; then
bash ./docker_Setup.sh
bash ./building_Apps.sh
rm flag.txt
dd.sh v_latest
else
sudo bash ./kernal_patch.sh
rm kernal_patch.sh  
bash ./dependencies.sh &&
bash ./move_to_root.sh 
cd ~
bash ./test_harness.sh 
cd ~
bash ./connectedhomeip.sh &&
bash ./config.sh
touch flag.txt
sudo reboot
fi
