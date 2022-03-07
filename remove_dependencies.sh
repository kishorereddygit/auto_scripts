sudo apt-get remove git gcc g++ python pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev python3-pip zip pi-bluetooth -y
sudo apt remove default-jre -y
sudo apt remove default-jdk -y
#Install docker and docker compose
sudo apt-get remove \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo apt-get remove docker-ce docker-ce-cli containerd.io -y
sudo pip3 remove docker-compose
sudo apt-get remove pi-bluetooth avahi-utils -y
sudo apt remove net-tools -y
sudo apt-get remove linux-modules-extra-raspi -y
