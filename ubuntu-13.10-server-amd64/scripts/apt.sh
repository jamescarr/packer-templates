#!/bin/sh -x
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
apt-get -y install dkms
apt-get -y install nfs-common
apt-get -y install --no-install-recommends rake
apt-get -y install tmux emacs nano curl vim tree htop smartmontools mosh inotify-tools zerofree software-properties-common ncdu silversearcher-ag unzip
#Some metrics gathering tools
apt-get -y install apachetop atop nmon dstat sysstat glances goaccess iotop