#!/bin/sh

sudo apt update
#Install Steghide
sudo apt install -y steghide
# Install docker and docker compose
printf '%s\n' "deb https://download.docker.com/linux/debian bullseye stable" |
  sudo tee /etc/apt/sources.list.d/docker-ce.list

curl -fsSL https://download.docker.com/linux/debian/gpg |
  sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-ce-archive-keyring.gpg

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
#Install gdown for downloading files from google drive
cd ~/Downloads
#Download Background photo
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1G3ocEuBSHqVejQS_P8lAvXlUNhUnMY-S' -O ace.jpg

#Set Background photo for XFCE desktop
sudo xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/image-path -s ~/Downloads/ace.jpg
rm ~/Downloads/ace.jpg

# #Placehodler for Bianca's WP lab
# sudo docker pull ionesb1/gencyber23wpdb:version1
# sudo docker pull ionesb1/gencyber23wp:version1
# #Create wordpress container from images
# sudo docker create ionesb1/gencyber23wpdb:version1 --name wpdb
# sudo docker create ionesb1/gencyber23wp:version1 --name wp
# sudo docker start wpdb wp

#Install Coltons Cyber Clinic lab
#cd ~
# git clone https://github.com/colton-gabertan/cyber-clinic-lab.git
# cd cyber-clinic-lab
#This may take up to 10 minutes
# echo "Spinning up containers for the lab, this may take up to **10 minutes**"
# sudo docker compose up -d
# sudo docker compose down -v

cd ~
echo "-* SCRIPT COMPLETED *-"
newgrp docker