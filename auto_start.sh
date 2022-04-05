FILE=/home/ubuntu/flag.txt
if test -f "$FILE"; then
bash ./docker_Setup.sh
bash ./building_Apps.sh
rm flag.txt
dd.sh v_latest
else
bash ./move_to_root.sh
cd /home/ubuntu
pwd
#sudo bash ./kernal_patch.sh
sudo rm -rf kernal_patch.sh
sudo bash ./dependencies.sh &&
#cd /home/ubuntu
sudo bash ./test_harness.sh &&
bash ./connectedhomeip.sh &&
bash ./config.sh
touch flag.txt
sudo reboot
fi
