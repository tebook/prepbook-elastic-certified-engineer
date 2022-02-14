#!/bin/bash

sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo systemctl start docker
sudo systemctl enable docker

echo "Installing Docker Compose"
sudo yum install -y python3-pip


pip3 install -U pip
pip3 install docker-compose

# Updating sysctl

sudo echo "vm.max_map_count=262144" >> /etc/sysctl.conf
sudo sysctl -p

# Directory for snapshot backup and restore
sudo mkdir /mnt/backup
sudo chmod 777 /mnt/backup

sudo /usr/local/bin/docker-compose -f cluster01.yml -p cluster01 up -d
sudo /usr/local/bin/docker-compose -f cluster02.yml -p cluster02 up -d

