#!/bin/bash

# Install Docker

sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Enable Docker Service

sudo systemctl start docker
sudo systemctl enable docker

if [ -f /etc/redhat-release ]; then
  sudo yum install -y python3-pip

fi

if [ -f /etc/lsb-release ]; then
  sudo apt-get update
  sudo apt install -y python3-pip
fi

# Update pip and install docker-compose

pip3 install -U pip
pip3 install docker-compose

# Updating sysctl

grep -q '^vm.max_map_count=' /etc/sysctl.conf || echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
sed -i 's/vm.max_map_count=.*$/'vm.max_map_count=262144'/' /etc/sysctl.conf

sudo sysctl -p

# filesystem for snapshot and restore

sudo mkdir -p /mnt/backup
sudo chmod 777 /mnt/backup

# Set NODE_IP and SCRIPT_DIR variables

NODE_IP=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ -z "$NODE_IP" ]
then
echo "Couldn't figure out IP address of the VM, make sure you have an IP assigned and connected to internet. Once done try running this script again"
else

grep -q '^NODE_IP=' $SCRIPT_DIR/.env || echo 'NODE_IP=VALUE' >> $SCRIPT_DIR/.env
sed -i 's/NODE_IP=.*$/'NODE_IP="$NODE_IP"'/' $SCRIPT_DIR/.env

sudo /usr/local/bin/docker-compose -f $SCRIPT_DIR/cluster01.yml -p cluster01 up -d
sudo /usr/local/bin/docker-compose -f $SCRIPT_DIR/cluster02.yml -p cluster02 up -d

sleep 10
if [ $( sudo docker ps | grep -v CONTAINER | wc -l ) -gt 5  ]; then
echo ""
echo "Installation Complete"

echo ""
echo "ekcluster01 Kibana GUI is accessible at $NODE_IP:5601"
echo "ekcluster02 Kibana GUI is accessible at $NODE_IP:5602"
else
echo "Installation Failed, correct any possible errors you see and try again"
exit 2
fi
fi
