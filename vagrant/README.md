# Vagrant Environments for Different Purposes
## ansible-lab
This a three VM enviroment to work with Ansible.  

VM1: ansiblecontrolserver  
Box: bento/ubuntu-20.04  
IP: 192.168.34.11

VM2: host01  
Box: bento/ubuntu-20.04  
IP: 192.168.34.12  

VM3: host02  
Box: bento/rockylinux-8  
IP: 192.168.34.13  

Generate SSH keys before bringing the environment up.
```
ssh-keygen -t ecdsa -f ./configs/id_ecdsa -C "vagrant@ansiblecontrolserver.lab"
vagrant up
```
It should show successful ping upon completion.

## devbox
This a single VM enviroment for general purpose development work.  
Box: bento/ubuntu-20.04  
IP: 192.168.33.11

## kubernetes-lab (In Progress)

## ubuntu2004-sandbox  
This is a single VM environment for playing around with Ubuntu-20.04.  
Box: bento/ubuntu-20.04  
IP: 192.168.33.12  
