#!/bin/bash
mkdir /var/run/sshd
# Set root password for SSH access (change 'your_password' to your desired password)
echo 'root:your_password' | chpasswd
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
sed -i 's/^#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config

# setup keys
mkdir -p /root/.ssh
chmod 700 /root/.ssh
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIInPjqseIUNlEKnhuwulg0zHwnuSNgzDm9JEgfenGCzx root@ubuntu-vdi
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILXSNO8OPYiZC4FoPWlMnfp/MltK+Ski0xA4kwtjf6mC desky@ubuntu-vdi
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINxGteolV2QkaOgBnwO8Ktuf3rmUlZHPBIvmyCnbhusH dickypatram@ubuntu-vdi' >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
nohup /usr/sbin/sshd -D
