#!/bin/sh

# Install docker and docker compose

sudo apt update

printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" | sudo tee /etc/apt/sources.list.d/docker-ce.list
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg

sudo apt update
sudo apt install -y docker.io
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker --now 

sudo usermod -aG docker kali
newgrp docker

#Install Steghide
sudo apt install -y steghide

#Install gdown for downloading files from google drive
cd ~/Downloads
pip install gdown

#Download Background photo
gdown https://drive.google.com/uc?id=1G3ocEuBSHqVejQS_P8lAvXlUNhUnMY-S

#Set Background photo for XFCE desktop
sudo xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor1/workspace0/last-image -s ~/Downloads/ace.jpg
rm ~/Downloads/ace.jpg

#Placehodler for Bianca's WP lab
sudo docker pull ionesb1/gencyber23wpdb:version1
sudo docker pull ionesb1/gencyber23wp:version1
#Create wordpress container from images
sudo docker create ionesb1/gencyber23wpdb:version1 --name wpdb
sudo docker create ionesb1/gencyber23wp:version1 --name wp
sudo docker start wpdb wp

#Install Coltons Cyber Clinic lab
cd ~
git clone https://github.com/colton-gabertan/cyber-clinic-lab.git
cd cyber-clinic-lab
#This may take up to 10 minutes
echo "Spinning up containers for the lab, this may take up to **10 minutes**"
docker compose up -d
docker compose down -v