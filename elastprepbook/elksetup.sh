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

NODE_IP=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')

NODE_IP=192.168.193.177

grep -q '^NODE_IP=' .env || echo 'NODE_IP=VALUE' >> .env
sed -i 's/NODE_IP=.*$/'NODE_IP="$NODE_IP"'/' .env

#grep -qxF 'NODE_IP=$NODE_IP' .env || echo 'NODE_IP='$NODE_IP >> .env

echo "ekcluster01 Kibana GUI is accessible at $NODE_IP:5601"
echo "ekcluster02 Kibana GUI is accessible at $NODE_IP:5602"
