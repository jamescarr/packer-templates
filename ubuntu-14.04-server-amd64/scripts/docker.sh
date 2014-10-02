#!/bin/sh -x

sudo apt-get update
# add to keychain
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# install lxc-docker
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install lxc-docker -y

# Add the docker group if it doesn't already exist.
sudo groupadd docker

# Add vagrant to the docker group.
sudo gpasswd -a vagrant docker

# Restart the Docker daemon.
sudo service docker restart
