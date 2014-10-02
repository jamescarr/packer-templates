#!/bin/sh
sleep 30

wget http://apt.puppetlabs.com/puppetlabs-release-saucy.deb


sudo dpkg -i puppetlabs-release-saucy.deb

sleep 10

sudo apt-get update

sudo apt-get install ruby1.9.3 puppet -y

sudo gem install librarian-puppet
