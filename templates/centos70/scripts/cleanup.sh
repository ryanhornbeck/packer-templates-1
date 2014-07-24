#!/bin/bash

echo "Clean yum cache"
yum -y clean all

echo "Remove kickstart file"
rm -f /root/anaconda-ks.cfg

echo "Remove DHCP leases"
rm -f /var/lib/NetworkManager/*.lease

echo "Clean udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth0

echo "Remove SSH host keys"
rm -f /etc/ssh/ssh_host*key*

echo "Removing packer script file (if any)" 
rm -f /tmp/script.sh

echo "Remove history"
history -c
unset HISTFILE
