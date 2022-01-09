#!/usr/bin/env bash

set -x

config_dir="/vagrant/configs/"
vagrant_home="/home/vagrant/"

if [[ $HOSTNAME == "ansiblecontrolserver" ]]
then
    apt-get install -y ansible ansible-lint yamllint
    cp "${config_dir}id_ecdsa" "${vagrant_home}.ssh"
    cp "${config_dir}id_ecdsa.pub" "${vagrant_home}.ssh"
    cat "${config_dir}id_ecdsa.pub" >> "${vagrant_home}.ssh/authorized_keys"
    chmod 600 "${vagrant_home}.ssh/id_ecdsa"
    chmod 644 "${vagrant_home}.ssh/id_ecdsa.pub"
    chmod 600 "${vagrant_home}.ssh/authorized_keys"
    chown vagrant.vagrant "${vagrant_home}.ssh/id_ecdsa"
    chown vagrant.vagrant "${vagrant_home}.ssh/id_ecdsa.pub"
    chown vagrant.vagrant "${vagrant_home}.ssh/authorized_keys"
    mkdir -p ansible-playbooks/inventory
    cp "${config_dir}ansible.cfg" "${vagrant_home}ansible-playbooks/"
    cp "${config_dir}hosts.ini" "${vagrant_home}ansible-playbooks/inventory/"
    chown vagrant.vagrant -R ansible-playbooks
    cd "${vagrant_home}ansible-playbooks"
    ansible all -m ping -e 'ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.ssh/id_ecdsa'
else
    cat "${config_dir}id_ecdsa.pub" >> "${vagrant_home}.ssh/authorized_keys"
    chmod 600 "${vagrant_home}.ssh/authorized_keys"
fi

set +x