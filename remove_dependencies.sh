sudo apt-get uninstall git gcc g++ python pkg-config libssl-dev libdbus-1-dev \
     libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
     python3-pip unzip libgirepository1.0-dev libcairo2-dev python3-pip zip pi-bluetooth -y
sudo apt uninstall default-jre -y
sudo apt uninstall default-jdk -y
#Install docker and docker compose
sudo apt-get uninstall \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo apt-get uninstall docker-ce docker-ce-cli containerd.io -y
sudo pip3 uninstall docker-compose
sudo apt-get uninstall pi-bluetooth avahi-utils -y
sudo apt uninstall net-tools -y
sudo apt-get uninstall linux-modules-extra-raspi -y
