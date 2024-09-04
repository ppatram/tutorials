#!/bin/bash

# install docker
# sudo apt install curl vim net-tools openssh-server
# sudo swapoff /swapfile
# sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
# sudo apt-get update
# sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu
# sudo apt-mark hold docker-ce


# install kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl
