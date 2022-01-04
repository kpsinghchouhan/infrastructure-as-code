#!/usr/bin/env bash
set -x
# Upgrade packages
apt update -y
apt upgrade -y
# Install KVM
apt-get install -y qemu-kvm libvirt-bin bridge-utils virtinst virt-manager
# Install firewalld
apt-get install -y firewalld
# Install ftp and vsftp
apt-get install -y vsftpd ftp
# Install stress package for stress testing
apt-get install -y stress
# Install X11 apps
apt-get install -y X11-apps
# Install parallel-ssh package pssh
apt-get install -y pssh
# Remove previous VNC server and install latest
apt-get purge -y tigthvncserver
apt-get install -y tigervnc-standalone-server tigervnc-common tigervnc-viewer
# Install DNS BIND package
apt-get install -y bind9
# Install Apache2 Web Server
apt-get install -y apache2
# Install Postfix mail server and utilities
apt-get intall -y postfix mailutils 
# Install Dovecot mail
apt-get install -y mutt dovecot-imapd dovecot-pop3d dovecot-core dovecot-lmtpd
# Install GNU Utilities
apt-get install -y gnutls-bin
# Install ntp
apt-get install -y ntp
# Install Squid Proxy
apt-get install -y squid
# Install NFS
apt-get install -y nfs-common nfs-kernel-server
# Install Samba
apt-get install -y samba smbclient
# Install netcat and telnet
apt-get install -y netcat-openbsd
apt-get install -y telnet
# Install iptables-persistent package
apt-get install -y iptables-persistent
# Install nftables
apt-get install -y nftables
# Install lxc
apt-get install -y lxc
# Install MariaDB
apt-get install -y mariadb-server
# Install Make program for C
apt-get install -y cmake
# Install 
apt-get install dh-make fakeroot build-essential