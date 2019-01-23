#!/bin/bash
set -e
#provision.sh
 sudo ucf --purge /boot/grub/menu.lst
 sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
 sudo apt-get update
 sudo UCF_FORCE_CONFFNEW=YES apt-get upgrade -y     # ucf --purge and UCF_FORCE_CONFFNEW is used to avoid the grub question
 echo "apt-get update done."
 sudo apt-get install -y python-dev python-pip
 sudo pip install ansible
#  sudo timedatectl set-timezone Asia/Kolkata
 sudo localectl set-locale LANG=en_US.utf8
 sudo apt-get install git
 sudo git clone https://github.com/subodhonline/TerraformPackerAnsible.git
 echo "Running Ansible."
 sudo ansible-playbook ./TerraformPackerAnsible/ansible/playbook.yml