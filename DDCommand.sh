sudo apt-get update -y
sudo apt-get install -y dcfldd

# Change sdb to the specific partition and add a image name
sudo dcfldd if=/dev/sdb of=ImageName.img
wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh
chmod +x pishrink.sh
sudo mv pishrink.sh /usr/local/bin

# -z for .gz and -Z for .xz Format
sudo pishrink.sh -z ImageName.img
