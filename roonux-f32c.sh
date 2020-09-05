#!/bin/bash

set -o errexit

# get pre-required repo for ffmpeg
dnf -y install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# install dependencies
dnf -y install ffmpeg iptables cifs-utils wget htop bzip2 \
    chkconfig iptables-services
# get the roonserver install script, make it run and clean it up
[[ ! -f roonserver-installer-linuxx64.sh ]] && \
    wget http://download.roonlabs.com/builds/roonserver-installer-linuxx64.sh && \
    sed -i 's/confirm "Do/echo "Do/g' roonserver-installer-linuxx64.sh
sh roonserver-installer-linuxx64.sh && rm roonserver-installer-linuxx64.sh
# restore selinux security context for Roon Server
/sbin/restorecon /opt/RoonServer/start.sh
# iptables to allow the server to communicate to the network
iptables -A INPUT -s 224.0.0.0/4 -j ACCEPT
iptables -A INPUT -d 224.0.0.0/4 -j ACCEPT
iptables -A INPUT -s 240.0.0.0/5 -j ACCEPT
iptables -A INPUT -m pkttype --pkt-type multicast -j ACCEPT
iptables -A INPUT -m pkttype --pkt-type broadcast -j ACCEPT
iptables -A INPUT -s 10.230.0.0/24 -p udp --dport 9003 -j ACCEPT
iptables -A INPUT -s 10.230.0.0/24 -p tcp --match multiport --dports 9100:9200 -j ACCEPT
# make iptables persistent across reboots
service iptables save
service iptables restart
chkconfig iptables on
# restart the roonserver
service roonserver restart
