#!/usr/bin/env bash

## Standard boostrap + workaround for failing apt-get update
apt-get clean
rm -rf /var/lib/apt/lists/partial
apt-get update -o Acquire::CompressionTypes::Order::=gz
apt-get -y install cloud-init
apt-get update
apt-get -y upgrade

# Add no-password sudo config for vagrant user
useradd redis
echo "%redis ALL=NOPASSWD:ALL" > /etc/sudoers.d/redis
chmod 0440 /etc/sudoers.d/redis

# Add flask to sudo group
usermod -a -G sudo redis

# Install Linux headers and compiler toolchain
apt-get -y install build-essential linux-headers-$(uname -r)

# unattended apt-get upgrade
DEBIAN_FRONTEND=noninteractive DEBIAN_PRIORITY=critical apt-get -q -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" upgrade

## Box specific provision
apt-get -y install redis-server
systemctl enable redis-server

# Install some tools
apt-get -y install jq curl unzip vim tmux cloud-init

apt-get autoremove -y
apt-get clean

# Removing leftover leases and persistent rules
echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*
