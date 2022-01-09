#!/usr/bin/env bash

NETWORK=$1
DOMAIN=$2

cat <<EOF >/etc/hosts
127.0.0.1   localhost
${NETWORK}11    ansiblecontrolserver${DOMAIN}   ansiblecontrolserver    
${NETWORK}12    host01${DOMAIN} host01
${NETWORK}13    host02${DOMAIN} host02


# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF