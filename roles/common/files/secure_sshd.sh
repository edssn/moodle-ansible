#!/bin/bash
# Description: Script to enable secure ssh logins 
# Changes Script do
#   - Disable Root Login with password
#   - Disable Root Password Authentication
#   - Enable PubkeyAuthentication Login

# Backup original ssh configuration file
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Comment current policy
sudo sed -i 's/^PermitRootLogin/#PermitRootLogin/g' /etc/ssh/sshd_config
sudo sed -i 's/^PasswordAuthentication/#PasswordAuthentication/g' /etc/ssh/sshd_config
sudo sed -i 's/^PubkeyAuthentication/#PubkeyAuthentication/g' /etc/ssh/sshd_config

# Add new confguration
sudo sed -i '0,/^#PermitRootLogin.*$/s//PermitRootLogin without-password/g' /etc/ssh/sshd_config
sudo sed -i '0,/^#PasswordAuthentication.*$/s//PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo sed -i '0,/^#PubkeyAuthentication.*$/s//PubkeyAuthentication yes/g' /etc/ssh/sshd_config