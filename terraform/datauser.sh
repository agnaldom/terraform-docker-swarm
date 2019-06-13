#!/bin/bash
export LC_ALL=C
sudo apt-get update -y
sudo apt-get upgrade -y

### install python-minimal
sudo apt-get install python-minimal -y

### Install docker
curl -fsSL https://get.docker.com -o get-docker.sh 
sh sh get-docker.sh

## Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Docker installed..."
sudo usermod -aG docker ${whoami}
sudo systemctl enable docker
sudo systemctl start docker

echo "Install docker-machine"
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo install /tmp/docker-machine /usr/local/bin/docker-machine
  echo "docker-machine installed..."